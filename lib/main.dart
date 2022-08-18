import 'package:bookstore/ui/constants/routes.dart';
import 'package:bookstore/ui/providers/book_provider.dart';
import 'package:bookstore/ui/routers/app_routes.dart';
import 'package:bookstore/ui/styles/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const BookstoreAppState());
}

class BookstoreAppState extends StatelessWidget {
  const BookstoreAppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (BuildContext context) => BookProvider()),
      ],
      child: const BookstoreApp(),
    );
  }
}

class BookstoreApp extends StatelessWidget {
  const BookstoreApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.home,
      routes: AppRoutes.routes,
      theme: AppTheme.lightTheme,
    );
  }
}
