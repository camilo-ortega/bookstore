import 'package:bookstore/ui/helpers/screen.dart';
import 'package:bookstore/ui/providers/book_provider.dart';
import 'package:bookstore/ui/screens/widgets/card_swiper.dart';
import 'package:bookstore/ui/search/book_search_delegate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Screen.initialize(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookstore'),
        actions: [
          IconButton(
              icon: const Icon(Icons.search_outlined),
              onPressed: () {
                showSearch(context: context, delegate: BookSearchDelegate());
              }),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            CardSwiper(),
          ],
        ),
      ),
    );
  }
}
