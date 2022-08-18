import 'package:bookstore/config/use_case_config.dart';
import 'package:bookstore/domain/models/book/book.dart';
import 'package:flutter/material.dart';

class BookProvider extends ChangeNotifier {
  UseCaseConfig useCaseConfig = UseCaseConfig();

  Book? bookDetail;
  List<Book> newReleasesBooks = [];
  List<Book> booksByQuery = [];

  getNewReleasesBooks() async {
    newReleasesBooks = await useCaseConfig.getBookUseCase.getNewReleasesBooks();
    notifyListeners();
  }

  getBooksByQuery(String query) async {
    booksByQuery = await useCaseConfig.getBookUseCase.getBooksByQuery(query);
    notifyListeners();
  }

  getBookDetailsByISBN(String isbn13) async {
    bookDetail =
        await useCaseConfig.getBookUseCase.getBookDetailsByISBN(isbn13);
    notifyListeners();
  }
}
