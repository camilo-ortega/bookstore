import 'package:bookstore/domain/models/book/book.dart';
import 'package:bookstore/domain/models/book/book_details_response.dart';
import 'package:bookstore/domain/models/book/book_search_response.dart';
import 'package:bookstore/ui/helpers/screen.dart';
import 'package:bookstore/ui/providers/book_provider.dart';
import 'package:bookstore/ui/routers/app_navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookSearchDelegate extends SearchDelegate {
  @override
  String get searchFieldLabel => 'Search book';

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () => query = '',
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios_new),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _emptyContainer();
  }

  Widget _emptyContainer() {
    return Center(
      child: Icon(
        Icons.book_outlined,
        color: Colors.black38,
        size: Screen.getDiagonalInPercent(15),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return _emptyContainer();
    }

    final bookProvider = Provider.of<BookProvider>(context);

    return FutureBuilder(
      future: bookProvider.getBooksByQuery(query),
      builder:
          (BuildContext context, AsyncSnapshot<BookSearchResponse> snapshot) {
        if (!snapshot.hasData) {
          return SizedBox(
            width: double.infinity,
            height: Screen.getHeightInPercent(60),
            child: const Center(
              child: CupertinoActivityIndicator(),
            ),
          );
        }
        BookSearchResponse bookSearch = snapshot.data!;

        return Container(
          margin: EdgeInsets.symmetric(
            vertical: Screen.getHeightInPercent(2),
          ),
          child: ListView.builder(
              itemCount: bookSearch.books.length,
              itemBuilder: (_, int index) =>
                  _BookItem(bookSearch.books.elementAt(index))),
        );
      },
    );
  }
}

class _BookItem extends StatelessWidget {
  final Book book;

  const _BookItem(this.book);

  @override
  Widget build(BuildContext context) {
    final AppNavigator appNavigator = AppNavigator.of(context);
    final bookProvider = Provider.of<BookProvider>(context);
    List<Future<BookDetailsResponse>> temp = [];

    temp.add(bookProvider.getBookDetailsByISBN(book.isbn13));

    return ListTile(
      leading: Hero(
        tag: book.isbn13,
        child: FadeInImage(
          placeholder: NetworkImage(book.image),
          image: NetworkImage(book.image),
          width: Screen.getWidthInPercent(15),
          fit: BoxFit.contain,
        ),
      ),
      title: Text(book.title),
      subtitle: Text(book.subtitle),
      onTap: () {
        appNavigator.toBookDetailScreen(temp.first);
      },
    );
  }
}
