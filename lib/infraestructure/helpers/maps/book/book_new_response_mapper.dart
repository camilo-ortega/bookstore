import 'package:bookstore/domain/models/book/book.dart';
import 'package:bookstore/domain/models/book/book_new_response.dart';
import 'package:bookstore/infraestructure/helpers/maps/book/book_mapper.dart';
import 'package:bookstore/infraestructure/helpers/maps/common/base_mapper.dart';

class BookNewResponseMapper implements BaseMapper<BookNewResponseMapper> {
  final BookMapper _bookMapper = BookMapper();

  @override
  fromMap(Map<String, dynamic> json) {
    return BookNewResponse(
      error: json["error"],
      total: json["total"],
      books: List<Book>.from(json["books"].map((x) => _bookMapper.fromMap(x))),
    );
  }
}
