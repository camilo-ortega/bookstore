import 'package:bookstore/domain/models/book/book.dart';
import 'package:bookstore/domain/models/book/book_search_response.dart';
import 'package:bookstore/infraestructure/helpers/maps/book/book_mapper.dart';
import 'package:bookstore/infraestructure/helpers/maps/common/base_mapper.dart';

class BookSearchResponseMapper implements BaseMapper<BookSearchResponseMapper> {
  final BookMapper _bookMapper = BookMapper();

  @override
  fromMap(Map<String, dynamic> json) {
    return BookSearchResponse(
      error: json["error"],
      total: json["total"],
      page: json["page"],
      books: List<Book>.from(json["books"].map((x) => _bookMapper.fromMap(x))),
    );
  }
}
