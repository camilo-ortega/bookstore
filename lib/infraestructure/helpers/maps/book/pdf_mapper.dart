import 'package:bookstore/domain/models/book/pdf.dart';
import 'package:bookstore/infraestructure/helpers/maps/common/base_mapper.dart';

class PdfMapper implements BaseMapper<PdfMapper> {
  @override
  fromMap(Map<String, dynamic> json) {
    return Pdf(
      chapter2: json["Chapter 2"],
      chapter5: json["Chapter 5"],
    );
  }
}
