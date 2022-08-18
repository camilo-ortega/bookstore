import 'package:bookstore/domain/models/book/book.dart';
import 'package:bookstore/domain/models/book/book_new_response.dart';
import 'package:bookstore/domain/models/book/gateway/book_gateway.dart';

class GetBookUseCase {
  GetBookUseCase(this._bookGateway);

  final BookGateway _bookGateway;

  Future<List<Book>> getBooksByQuery(String query) async {
    return _bookGateway.getBooksByQuery(query);
  }

  Future<BookNewResponse> getNewReleasesBooks() async {
    return _bookGateway.getNewReleasesBooks();
  }

  Future<Book> getBookDetailsByISBN(String isbn13) async {
    return _bookGateway.getBookDetailsByISBN(isbn13);
  }
}
