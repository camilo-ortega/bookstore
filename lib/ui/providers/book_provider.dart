import 'package:bookstore/config/use_case_config.dart';
import 'package:bookstore/domain/models/book/book.dart';
import 'package:bookstore/domain/models/book/book_details_response.dart';
import 'package:bookstore/domain/models/book/book_new_response.dart';
import 'package:bookstore/domain/models/book/book_search_response.dart';
import 'package:flutter/material.dart';

class BookProvider extends ChangeNotifier {
  BookProvider() {
    getNewReleasesBooks();
  }

  final UseCaseConfig _useCaseConfig = UseCaseConfig();

  List<Book> booksByQuery = [];

  Future<BookNewResponse> getNewReleasesBooks() async {
    return await _useCaseConfig.getBookUseCase.getNewReleasesBooks();
  }

  Future<BookSearchResponse> getBooksByQuery(String query) async {
    return await _useCaseConfig.getBookUseCase.getBooksByQuery(query);
  }

  Future<BookDetailsResponse> getBookDetailsByISBN(String isbn13) async {
    return await _useCaseConfig.getBookUseCase.getBookDetailsByISBN(isbn13);
  }
}
