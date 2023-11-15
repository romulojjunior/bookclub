import 'package:bookclub/domain/entities/book.dart';
import 'package:bookclub/domain/entities/writer.dart';
import 'package:bookclub/generated/l10n.dart';
import 'package:bookclub/ui/pages/home/widgets/avatars_row_widget.dart';
import 'package:bookclub/ui/pages/home/widgets/recommended_books_widget.dart';
import 'package:bookclub/ui/router.dart';
import 'package:bookclub/ui/widgets/books_widget.dart';
import 'package:bookclub/ui/state/books_bloc/books_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class TabHome extends StatelessWidget {
  final String title;
  const TabHome({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    List<Book> recommendedBooks = context.watch<BooksBloc>().state.recommended;
    bool isRecommendedLoading = context.watch<BooksBloc>().state.isRecommendedLoading;

    List<Book> trendsBooks = context.watch<BooksBloc>().state.trends;
    bool isTrendsLoading = context.watch<BooksBloc>().state.isTrendsLoading;

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            AvatarsRowWidget(
              users: Writer.getSamples(),
            ),
            BooksWidget(
              title: S.of(context).trends,
              isLoading: isTrendsLoading,
              books: trendsBooks,
              onBookSelected: (bookId) {
                context.push(RouterPaths.getBookDetailsPath(bookId));
              },
            ),
            RecommendedBooksWidget(
              isLoading: isRecommendedLoading,
              recommendedBooks: recommendedBooks,
              onBookSelected: (bookId) {
                context.push(RouterPaths.getBookDetailsPath(bookId));
              },
            ),
          ],
        ),
      ),
    );
  }
}
