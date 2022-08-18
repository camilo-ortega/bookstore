import 'package:bookstore/domain/models/book/book.dart';

class BookNewResponse {
  BookNewResponse({
    required this.error,
    required this.total,
    required this.books,
  });

  String error;
  String total;
  List<Book> books;
}
