import 'package:bookstore/domain/models/book/book_details_response.dart';
import 'package:bookstore/domain/models/book/book_new_response.dart';
import 'package:bookstore/domain/models/book/book_search_response.dart';

abstract class BookGateway {
  Future<BookSearchResponse> getBooksByQuery(String query);
  Future<BookNewResponse> getNewReleasesBooks();
  Future<BookDetailsResponse> getBookDetailsByISBN(String isbn13);
}
