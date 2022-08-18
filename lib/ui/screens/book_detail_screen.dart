import 'package:bookstore/domain/models/book/book_details_response.dart';
import 'package:bookstore/ui/helpers/screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookDetailScreen extends StatelessWidget {
  const BookDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bookDetails = ModalRoute.of(context)!.settings.arguments
        as Future<BookDetailsResponse>;

    return FutureBuilder(
      future: bookDetails,
      builder:
          (BuildContext context, AsyncSnapshot<BookDetailsResponse?> snapshot) {
        if (!snapshot.hasData) {
          return SizedBox(
            width: double.infinity,
            height: Screen.getHeightInPercent(60),
            child: const Center(
              child: CupertinoActivityIndicator(),
            ),
          );
        }
        BookDetailsResponse bookDetails = snapshot.data!;

        return Scaffold(
            body: CustomScrollView(
          slivers: [
            _CustomAppBar(bookDetails),
            SliverList(
                delegate: SliverChildListDelegate([
              _PosterAndTitle(bookDetails),
              _Overview(bookDetails),
            ]))
          ],
        ));
      },
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  final BookDetailsResponse book;

  const _CustomAppBar(this.book);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Container(
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.symmetric(
            horizontal: Screen.getWidthInPercent(10),
          ),
          child: Text(book.title, textAlign: TextAlign.center),
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  final BookDetailsResponse book;

  const _PosterAndTitle(this.book);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: Screen.getHeightInPercent(2),
        horizontal: Screen.getWidthInPercent(3),
      ),
      child: Row(
        children: [
          Hero(
            tag: book.isbn13,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: NetworkImage(book.image),
                image: NetworkImage(book.image),
                height: Screen.getHeightInPercent(25),
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: TextStyle(
                      fontSize: Screen.getDiagonalInPercent(2),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: Screen.getDiagonalInPercent(1),
                ),
                Text(
                  book.subtitle,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: TextStyle(
                      fontSize: Screen.getDiagonalInPercent(1.5),
                      fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  height: Screen.getDiagonalInPercent(1),
                ),
                Row(
                  children: [
                    Icon(Icons.star_outline,
                        size: Screen.getDiagonalInPercent(2),
                        color: Colors.grey),
                    SizedBox(
                      width: Screen.getWidthInPercent(2),
                    ),
                    Text(
                      book.rating,
                      style: TextStyle(
                          fontSize: Screen.getDiagonalInPercent(1.5),
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
                SizedBox(
                  height: Screen.getDiagonalInPercent(1),
                ),
                Text(
                  book.price,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: Screen.getDiagonalInPercent(1.5),
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  final BookDetailsResponse book;

  const _Overview(this.book);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Screen.getWidthInPercent(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Description',
            style: TextStyle(
                fontSize: Screen.getDiagonalInPercent(2),
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: Screen.getDiagonalInPercent(1),
          ),
          Text(
            book.desc,
            style: TextStyle(
                fontSize: Screen.getDiagonalInPercent(1.5),
                fontWeight: FontWeight.normal),
          ),
          SizedBox(
            height: Screen.getDiagonalInPercent(1),
          ),
          Text(
            'Language',
            style: TextStyle(
                fontSize: Screen.getDiagonalInPercent(2),
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: Screen.getDiagonalInPercent(1),
          ),
          Row(
            children: [
              Icon(Icons.language_outlined,
                  size: Screen.getDiagonalInPercent(2), color: Colors.grey),
              SizedBox(
                width: Screen.getWidthInPercent(2),
              ),
              Text(
                book.language,
                style: TextStyle(
                    fontSize: Screen.getDiagonalInPercent(1.5),
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
          SizedBox(
            height: Screen.getDiagonalInPercent(1),
          ),
          Text(
            'Pages',
            style: TextStyle(
                fontSize: Screen.getDiagonalInPercent(2),
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: Screen.getDiagonalInPercent(1),
          ),
          Text(
            book.pages,
            style: TextStyle(
                fontSize: Screen.getDiagonalInPercent(1.5),
                fontWeight: FontWeight.normal),
          ),
          SizedBox(
            height: Screen.getDiagonalInPercent(1),
          ),
          Text(
            'Authors',
            style: TextStyle(
                fontSize: Screen.getDiagonalInPercent(2),
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: Screen.getDiagonalInPercent(1),
          ),
          SizedBox(
            width: Screen.getWidthInPercent(2),
          ),
          Text(
            book.authors,
            style: TextStyle(
                fontSize: Screen.getDiagonalInPercent(1.5),
                fontWeight: FontWeight.normal),
          ),
          SizedBox(
            height: Screen.getDiagonalInPercent(1),
          ),
          Text(
            'Publisher',
            style: TextStyle(
                fontSize: Screen.getDiagonalInPercent(2),
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: Screen.getDiagonalInPercent(1),
          ),
          Text(
            book.publisher,
            style: TextStyle(
                fontSize: Screen.getDiagonalInPercent(1.5),
                fontWeight: FontWeight.normal),
          ),
          SizedBox(
            height: Screen.getDiagonalInPercent(1),
          ),
          Text(
            'Year',
            style: TextStyle(
                fontSize: Screen.getDiagonalInPercent(2),
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: Screen.getDiagonalInPercent(1),
          ),
          Text(
            book.year,
            style: TextStyle(
                fontSize: Screen.getDiagonalInPercent(1.5),
                fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
