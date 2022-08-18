import 'package:bookstore/ui/constants/routes.dart';
import 'package:bookstore/ui/model_view/book/book_detail_model_view.dart';
import 'package:bookstore/ui/model_view/book/list_book_model_view.dart';
import 'package:bookstore/ui/model_view/book/search_book_model_view.dart';
import 'package:bookstore/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    Routes.home: (BuildContext context) => const HomeScreen(),
    Routes.bookDetail: (BuildContext context) => const BookDetailModelView(),
    Routes.listBook: (BuildContext context) => const ListBookModelView(),
    Routes.searchBook: (BuildContext context) => const SearchBookModelView(),
  };
}
