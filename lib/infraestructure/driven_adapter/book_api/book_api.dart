import 'dart:convert';

import 'package:bookstore/domain/models/book/book.dart';
import 'package:bookstore/domain/models/book/book_new_response.dart';
import 'package:bookstore/domain/models/book/gateway/book_gateway.dart';
import 'package:bookstore/infraestructure/helpers/maps/book/book_details_response_mapper.dart';
import 'package:bookstore/infraestructure/helpers/maps/book/book_new_response_mapper.dart';
import 'package:bookstore/infraestructure/helpers/maps/book/book_search_response_mapper.dart';
import 'package:http/http.dart' as http;

class BookApi extends BookGateway {
  final BookSearchResponseMapper _bookSearchResponseMapper =
      BookSearchResponseMapper();
  final BookDetailsResponseMapper _bookDetailsResponseMapper =
      BookDetailsResponseMapper();
  final BookNewResponseMapper _bookNewResponseMapper = BookNewResponseMapper();

  @override
  Future<List<Book>> getBooksByQuery(String query) async {
    final url = 'https://api.itbook.store/1.0/search/$query';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return _bookSearchResponseMapper.fromMap(jsonDecode(response.body));
    } else {
      throw Exception('Cannot GET $url');
    }
  }

  @override
  Future<Book> getBookDetailsByISBN(String isbn13) async {
    final url = 'https://api.itbook.store/1.0/books/$isbn13';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return _bookDetailsResponseMapper.fromMap(jsonDecode(response.body));
    } else {
      throw Exception('Cannot GET $url');
    }
  }

  @override
  Future<BookNewResponse> getNewReleasesBooks() async {
    const url = 'https://api.itbook.store/1.0/new';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return _bookNewResponseMapper.fromMap(jsonDecode(response.body));
    } else {
      throw Exception('Cannot GET $url');
    }
  }
}
