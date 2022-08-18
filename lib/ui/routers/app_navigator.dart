import 'package:bookstore/domain/models/book/book.dart';
import 'package:bookstore/ui/constants/routes.dart';
import 'package:flutter/material.dart';

class AppNavigator {
  static AppNavigator of(BuildContext context) => AppNavigator(context);

  AppNavigator(BuildContext context) {
    _navigatorState = Navigator.of(context);
  }

  late final NavigatorState _navigatorState;

  toBookDetailScreen(Book book) {
    _navigatorState.pushNamed(Routes.bookDetail, arguments: book);
  }
}
