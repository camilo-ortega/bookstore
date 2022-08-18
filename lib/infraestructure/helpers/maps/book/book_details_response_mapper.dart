import 'package:bookstore/domain/models/book/book_details_response.dart';
import 'package:bookstore/infraestructure/helpers/maps/book/pdf_mapper.dart';
import 'package:bookstore/infraestructure/helpers/maps/common/base_mapper.dart';

class BookDetailsResponseMapper
    implements BaseMapper<BookDetailsResponseMapper> {
  final PdfMapper _pdfMapper = PdfMapper();

  @override
  fromMap(Map<String, dynamic> json) {
    return BookDetailsResponse(
      error: json["error"],
      title: json["title"],
      subtitle: json["subtitle"],
      authors: json["authors"],
      publisher: json["publisher"],
      language: json["language"],
      isbn10: json["isbn10"],
      isbn13: json["isbn13"],
      pages: json["pages"],
      year: json["year"],
      rating: json["rating"],
      desc: json["desc"],
      price: json["price"],
      image: json["image"],
      url: json["url"],
      pdf: _pdfMapper.fromMap(json["pdf"]),
    );
  }
}
