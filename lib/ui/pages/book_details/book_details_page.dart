import 'package:bookclub/data/exceptions/connection_exception.dart';
import 'package:bookclub/data/exceptions/not_found_exception.dart';
import 'package:bookclub/domain/entities/book.dart';
import 'package:bookclub/domain/utils/html_utils.dart';
import 'package:bookclub/generated/l10n.dart';
import 'package:bookclub/ui/pages/book_details/widgets/book_panel_info.dart';
import 'package:bookclub/ui/state/book_details_bloc/book_details_bloc.dart';
import 'package:bookclub/ui/state/book_details_bloc/book_details_event.dart';
import 'package:bookclub/ui/state/favorites_cubit/favorites_cubit.dart';
import 'package:bookclub/ui/widgets/ui_conditional.dart';
import 'package:bookclub/ui/widgets/ui_error_message.dart';
import 'package:bookclub/ui/widgets/ui_loading_indicator.dart';
import 'package:bookclub/ui/widgets/ui_scaffold.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';

class BookDetailsPage extends StatefulWidget {
  const BookDetailsPage({super.key, required this.bookId});

  final String bookId;

  @override
  State<BookDetailsPage> createState() => _BookDetailsPageState();
}

class _BookDetailsPageState extends State<BookDetailsPage> {
  static const double _containerMaxWidth = 500;
  static const double _largeScreenWidth = 1024;

  @override
  void initState() {
    super.initState();
    context.read<BookDetailsBloc>().add(LoadBookEvent(id: widget.bookId));
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isLargeScreen = MediaQuery.of(context).size.width > _largeScreenWidth;
    BookDetailsBloc bookDetailsBloc = context.watch<BookDetailsBloc>();
    Book? book = bookDetailsBloc.state.book;
    Exception? uiException = bookDetailsBloc.state.exception;

    if (bookDetailsBloc.state.isLoading) {
      return UIScaffold(
          title: S.of(context).bookDetails,
          child: const SafeArea(
            child: Center(
              child: UILoadingIndicator(),
            ),
          ));
    }

    if (uiException is ConnectionException) {
      return UIScaffold(
        child: SafeArea(
          child: UIErrorMessage(
            title: S.of(context).connectionErrorTitle,
            message: S.of(context).connectionErrorMessage,
            onRetry: () {
              bookDetailsBloc.add(LoadBookEvent(id: widget.bookId));
            },
          ),
        ),
      );
    }

    if (uiException is NotFoundException || book == null) {
      String bookLabel = S.of(context).book;
      return UIScaffold(
        child: SafeArea(
          child: UIErrorMessage(
            title: S.of(context).notFoundErrorTitle,
            message: S.of(context).notFoundErrorMessage(bookLabel),
            actionLabel: S.of(context).back,
            onRetry: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      );
    }

    if (uiException != null) {
      return UIScaffold(
        child: SafeArea(
          child: UIErrorMessage(
            actionLabel: S.of(context).back,
            onRetry: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      );
    }

    Widget bookPanelInfo = BookPanelInfo(
      book: book,
      isFavorite: context.watch<FavoritesCubit>().isFavoriteBook(book),
      onFavorite: (isFavorite) {
        isFavorite ? context.read<FavoritesCubit>().addBook(book) : context.read<FavoritesCubit>().removeBook(book.id!);
      },
    );

    List<Widget> body = [
      Column(
        children: [
          Container(
            margin: EdgeInsets.all(isLargeScreen ? 32 : 0),
            constraints: const BoxConstraints(
              maxWidth: _containerMaxWidth,
              minHeight: 500,
            ),
            child: Center(
              child: CachedNetworkImage(
                width: (screenWidth < 600) ? screenWidth : 600,
                fit: BoxFit.fitWidth,
                imageUrl: book.largeThumbnail ?? book.thumbnail ?? '',
                progressIndicatorBuilder: (context, url, downloadProgress) => const UILoadingIndicator(),
              ),
            ),
          ),
          UIConditional(
              canShow: !isLargeScreen,
              onBuild: (context) {
                return Container(
                  constraints: const BoxConstraints(maxWidth: _containerMaxWidth),
                  margin: const EdgeInsets.all(16),
                  child: bookPanelInfo,
                );
              }),
        ],
      ),
      Container(
        constraints: const BoxConstraints(maxWidth: _containerMaxWidth),
        margin: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              book.title,
              style: const TextStyle(fontSize: 36),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Text(
                HtmlUtils.removeTags(book.description ?? ''),
                maxLines: 20,
                style: const TextStyle(fontSize: 18),
              ),
            ),
            UIConditional(
                canShow: isLargeScreen,
                onBuild: (context) {
                  return bookPanelInfo;
                }),
          ],
        ),
      )
    ];

    return UIScaffold(
        title: S.of(context).bookDetails,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: LayoutBuilder(
                builder: (context, boxConstraints) {
                  if (isLargeScreen) {
                    return Container(
                        constraints: const BoxConstraints(maxWidth: 1280),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: body));
                  } else {
                    return Column(children: body);
                  }
                },
              ),
            ),
          ),
        ));
  }
}
