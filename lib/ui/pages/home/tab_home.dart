import 'package:bookclub/domain/entities/book.dart';
import 'package:bookclub/domain/entities/writer.dart';
import 'package:bookclub/generated/l10n.dart';
import 'package:bookclub/ui/pages/home/widgets/avatars_row_widget.dart';
import 'package:bookclub/ui/pages/home/widgets/recommended_books_widget.dart';
import 'package:bookclub/ui/router.dart';
import 'package:bookclub/ui/state/books_bloc/books_event.dart';
import 'package:bookclub/ui/widgets/books_widget.dart';
import 'package:bookclub/ui/state/books_bloc/books_bloc.dart';
import 'package:bookclub/ui/widgets/ui_conditional_widget.dart';
import 'package:bookclub/ui/widgets/ui_error_message.dart';
import 'package:flutter/material.dart';
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
    bool isUIErrorEnabled = context.watch<BooksBloc>().state.isUIErrorEnabled;

    if (isUIErrorEnabled) {
      return SafeArea(
        child: UIErrorMessage(
          onRetry: () {
            context.read<BooksBloc>().loadInitialData();
            context.read<BooksBloc>().add(DisableBooksUIErrorEvent());
          },
        ),
      );
    }

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            AvatarsRowWidget(
              users: Writer.getSamples(),
            ),
            UIConditionalWidget(
              canShow: trendsBooks.isNotEmpty,
              onBuild: (context) {
                return BooksWidget(
                  title: S.of(context).trends,
                  isLoading: isTrendsLoading,
                  books: trendsBooks,
                  onBookSelected: (bookId) {
                    context.push(RouterPaths.getBookDetailsPath(bookId));
                  },
                );
              },
            ),
            UIConditionalWidget(
              canShow: recommendedBooks.isNotEmpty,
              onBuild: (context) {
                return RecommendedBooksWidget(
                  isLoading: isRecommendedLoading,
                  recommendedBooks: recommendedBooks,
                  onBookSelected: (bookId) {
                    context.push(RouterPaths.getBookDetailsPath(bookId));
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
