import 'package:bookclub/domain/entities/book.dart';
import 'package:bookclub/domain/entities/writer.dart';
import 'package:bookclub/generated/l10n.dart';
import 'package:bookclub/ui/pages/home/widgets/avatars_row_widget.dart';
import 'package:bookclub/ui/pages/home/widgets/recommended_books_widget.dart';
import 'package:bookclub/ui/router.dart';
import 'package:bookclub/ui/state/books_bloc/books_event.dart';
import 'package:bookclub/ui/state/writers_cubit/writers_cubit.dart';
import 'package:bookclub/ui/widgets/ui_books.dart';
import 'package:bookclub/ui/state/books_bloc/books_bloc.dart';
import 'package:bookclub/ui/widgets/ui_conditional.dart';
import 'package:bookclub/ui/widgets/ui_custom_scroll_view.dart';
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
    BooksBloc booksBloc = context.watch<BooksBloc>();
    WritersCubit writersCubit = context.watch<WritersCubit>();

    List<Writer> writers = writersCubit.state.writers;
    List<Book> recommendedBooks = booksBloc.state.recommended;
    List<Book> trendsBooks = booksBloc.state.trends;

    bool isRecommendedLoading = booksBloc.state.isRecommendedLoading;
    bool isTrendsLoading = booksBloc.state.isTrendsLoading;

    bool isBooksUIErrorEnabled = booksBloc.state.isUIErrorEnabled;
    bool isWritersUIErrorEnabled = booksBloc.state.isUIErrorEnabled;

    if (isBooksUIErrorEnabled || isWritersUIErrorEnabled) {
      return SafeArea(
        child: UIErrorMessage(
          onRetry: () {
            writersCubit.loadInitialData();
            booksBloc.loadInitialData();
            booksBloc.add(DisableBooksUIErrorEvent());
          },
        ),
      );
    }

    return SafeArea(
      child: UICustomScrollView(
          onRefresh: () {
            context.read<BooksBloc>().loadInitialData();
          },
          slivers: [
            SliverList.list(children: [
              Column(
                children: <Widget>[
                  UIConditional(
                    canShow: writers.isNotEmpty,
                    onBuild: (context) {
                      return AvatarsRowWidget(
                        users: writers,
                      );
                    },
                  ),
                  UIConditional(
                    canShow: trendsBooks.isNotEmpty,
                    onBuild: (context) {
                      return UIBooks(
                        title: S.of(context).trends,
                        isLoading: isTrendsLoading,
                        books: trendsBooks,
                        onBookSelected: (bookId) {
                          context.push(RouterPaths.getBookDetailsPath(bookId));
                        },
                      );
                    },
                  ),
                  UIConditional(
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
              )
            ])
          ]),
    );
  }
}
