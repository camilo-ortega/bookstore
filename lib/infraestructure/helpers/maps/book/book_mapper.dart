import 'package:bookstore/domain/models/book/book.dart';
import 'package:bookstore/infraestructure/helpers/maps/common/base_mapper.dart';

class BookMapper implements BaseMapper<BookMapper> {
  @override
  fromMap(Map<String, dynamic> json) {
    return Book(
      title: json["title"],
      subtitle: json["subtitle"],
      isbn13: json["isbn13"],
      price: json["price"],
      image: json["image"],
      url: json["url"],
    );
  }
}
