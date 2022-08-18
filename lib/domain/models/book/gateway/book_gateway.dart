import 'package:bookstore/domain/models/book/book.dart';
import 'package:bookstore/domain/models/book/book_new_response.dart';

abstract class BookGateway {
  Future<List<Book>> getBooksByQuery(String query);
  Future<BookNewResponse> getNewReleasesBooks();
  Future<Book> getBookDetailsByISBN(String isbn13);
}
