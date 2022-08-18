import 'package:bookstore/domain/models/book/book_details_response.dart';
import 'package:bookstore/domain/models/book/book_new_response.dart';
import 'package:bookstore/domain/models/book/book_search_response.dart';
import 'package:bookstore/domain/models/book/gateway/book_gateway.dart';

class GetBookUseCase {
  GetBookUseCase(this._bookGateway);

  final BookGateway _bookGateway;

  Future<BookSearchResponse> getBooksByQuery(String query) async {
    return _bookGateway.getBooksByQuery(query);
  }

  Future<BookNewResponse> getNewReleasesBooks() async {
    return _bookGateway.getNewReleasesBooks();
  }

  Future<BookDetailsResponse> getBookDetailsByISBN(String isbn13) async {
    return _bookGateway.getBookDetailsByISBN(isbn13);
  }
}
