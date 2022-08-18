import 'package:bookstore/ui/constants/routes.dart';
import 'package:bookstore/ui/screens/book_detail_screen.dart';
import 'package:bookstore/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    Routes.home: (BuildContext context) => const HomeScreen(),
    Routes.bookDetail: (BuildContext context) => const BookDetailScreen(),
  };
}
