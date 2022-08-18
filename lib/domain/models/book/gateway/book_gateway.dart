import 'package:bookstore/domain/models/book/book.dart';

abstract class BookGateway {
  Future<List<Book>> getBooksByQuery(String query);
  Future<List<Book>> getNewReleasesBooks();
  Future<Book> getBookDetailsByISBN(String isbn13);
}
