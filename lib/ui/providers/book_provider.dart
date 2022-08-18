import 'package:bookstore/config/use_case_config.dart';
import 'package:bookstore/domain/models/book/book.dart';
import 'package:bookstore/domain/models/book/book_new_response.dart';
import 'package:flutter/material.dart';

class BookProvider extends ChangeNotifier {
  BookProvider() {
    getNewReleasesBooks();
  }

  final UseCaseConfig _useCaseConfig = UseCaseConfig();

  Book? bookDetail;
  List<Book> booksByQuery = [];

  Future<BookNewResponse> getNewReleasesBooks() async {
    return await _useCaseConfig.getBookUseCase.getNewReleasesBooks();
  }

  getBooksByQuery(String query) async {
    booksByQuery = await _useCaseConfig.getBookUseCase.getBooksByQuery(query);
    notifyListeners();
  }

  getBookDetailsByISBN(String isbn13) async {
    bookDetail =
        await _useCaseConfig.getBookUseCase.getBookDetailsByISBN(isbn13);
    notifyListeners();
  }
}
