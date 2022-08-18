import 'package:bookstore/domain/models/book/book.dart';
import 'package:bookstore/domain/models/book/book_details_response.dart';
import 'package:bookstore/domain/models/book/book_new_response.dart';
import 'package:bookstore/ui/helpers/screen.dart';
import 'package:bookstore/ui/providers/book_provider.dart';
import 'package:bookstore/ui/routers/app_navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:provider/provider.dart';

class CardSwiper extends StatelessWidget {
  const CardSwiper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BookProvider bookProvider = Provider.of<BookProvider>(context);
    final AppNavigator appNavigator = AppNavigator.of(context);

    List<Future<BookDetailsResponse>> temp = [];

    return FutureBuilder(
      future: bookProvider.getNewReleasesBooks(),
      builder:
          (BuildContext context, AsyncSnapshot<BookNewResponse?> snapshot) {
        if (!snapshot.hasData) {
          return SizedBox(
            width: double.infinity,
            height: Screen.getHeightInPercent(60),
            child: const Center(
              child: CupertinoActivityIndicator(),
            ),
          );
        }

        List<Book> books = snapshot.data!.books;

        for (var i in books) {
          temp.add(bookProvider.getBookDetailsByISBN(i.isbn13));
        }

        return SizedBox(
          width: double.infinity,
          height: Screen.getHeightSize,
          child: Column(
            children: [
              SizedBox(
                height: Screen.getHeightInPercent(5),
              ),
              Text(
                'New book releases',
                style: TextStyle(
                    fontSize: Screen.getDiagonalInPercent(2),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: Screen.getHeightInPercent(2),
              ),
              Swiper(
                pagination: const SwiperPagination(
                  alignment: Alignment.bottomCenter,
                  builder: DotSwiperPaginationBuilder(
                      color: Colors.grey, activeColor: Colors.indigo),
                ),
                layout: SwiperLayout.CUSTOM,
                customLayoutOption:
                    CustomLayoutOption(startIndex: -1, stateCount: 3).addRotate(
                        [-45.0 / 180, 0.0, 45.0 / 180]).addTranslate(const [
                  Offset(-370.0, -40.0),
                  Offset(0.0, 0.0),
                  Offset(370.0, -40.0)
                ]),
                itemCount: books.length > 9 ? 10 : books.length,
                itemWidth: Screen.getWidthSize,
                itemHeight: Screen.getHeightInPercent(55),
                itemBuilder: (BuildContext context, int index) {
                  final book = books[index];

                  return Container(
                    margin: EdgeInsets.all(
                      Screen.getWidthInPercent(5),
                    ),
                    child: Flexible(
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              appNavigator
                                  .toBookDetailScreen(temp.elementAt(index));
                            },
                            child: Hero(
                              tag: book.isbn13,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: FadeInImage(
                                  placeholder: NetworkImage(book.image),
                                  image: NetworkImage(book.image),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            '${index + 1}',
                            style: TextStyle(
                              fontSize: Screen.getDiagonalInPercent(1.5),
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
