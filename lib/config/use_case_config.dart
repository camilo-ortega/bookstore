import 'package:bookstore/domain/use_cases/book/get_book_use_case.dart';
import 'package:bookstore/infraestructure/driven_adapter/book_api/book_api.dart';

class UseCaseConfig {
  late GetBookUseCase getBookUseCase;
  late BookApi _bookApi;

  UseCaseConfig() {
    _bookApi = BookApi();
    getBookUseCase = GetBookUseCase(_bookApi);
  }
}
