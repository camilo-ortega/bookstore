import 'package:bookstore/domain/models/book/book.dart';
import 'package:bookstore/domain/models/book/book_new_response.dart';
import 'package:bookstore/ui/constants/images.dart';
import 'package:bookstore/ui/helpers/screen.dart';
import 'package:bookstore/ui/providers/book_provider.dart';
import 'package:bookstore/ui/routers/app_navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:provider/provider.dart';

class CardSwiper extends StatelessWidget {
  const CardSwiper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BookProvider bookProvider = Provider.of<BookProvider>(context);
    final AppNavigator appNavigator = AppNavigator.of(context);

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

        return SizedBox(
          width: double.infinity,
          height: Screen.getHeightInPercent(60),
          child: Swiper(
            itemCount: books.length,
            layout: SwiperLayout.STACK,
            itemWidth: Screen.getWidthInPercent(80),
            itemHeight: Screen.getHeightInPercent(50),
            itemBuilder: (BuildContext context, int index) {
              final book = books[index];

              return GestureDetector(
                onTap: () {
                  appNavigator.toBookDetailScreen(book);
                },
                child: Hero(
                  tag: book.isbn13,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: FadeInImage(
                      placeholder: const AssetImage(Images.noImage),
                      image: NetworkImage(book.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
