import 'package:bookstore/domain/models/book/book.dart';

class BookSearchResponse {
  BookSearchResponse({
    required this.error,
    required this.total,
    required this.books,
    required this.page,
  });

  String error;
  String total;
  String page;
  List<Book> books;
}
