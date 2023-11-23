import 'package:bookclub/data/exceptions/connection_exception.dart';
import 'package:bookclub/data/exceptions/not_found_exception.dart';
import 'package:bookclub/domain/entities/book.dart';
import 'package:bookclub/generated/l10n.dart';
import 'package:bookclub/ui/router.dart';
import 'package:bookclub/ui/state/search_cubit/search_cubit.dart';
import 'package:bookclub/ui/utils/screen_utils.dart';
import 'package:bookclub/ui/widgets/ui_book_card.dart';
import 'package:bookclub/ui/widgets/ui_conditional.dart';
import 'package:bookclub/ui/widgets/ui_error_message.dart';
import 'package:bookclub/ui/widgets/ui_loading_indicator.dart';
import 'package:bookclub/ui/widgets/ui_page_header.dart';
import 'package:bookclub/ui/widgets/ui_resizable.dart';
import 'package:bookclub/ui/widgets/ui_search_bar.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class TabSearch extends StatelessWidget {
  const TabSearch({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    SearchCubit searchCubit = context.watch<SearchCubit>();
    List<Book> books = searchCubit.state.books;
    Exception? searchUIException = searchCubit.state.exception;

    if (searchUIException is ConnectionException) {
      return SafeArea(
        child: UIErrorMessage(
          title: S.of(context).connectionErrorTitle,
          message: S.of(context).connectionErrorMessage,
          onRetry: () {
            String searchQuery = searchCubit.state.searchQuery ?? '';
            searchCubit.searchByName(searchQuery);
          },
        ),
      );
    }

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            UIPageHeader(title: title),
            UISearchBar(
              initialValue: searchCubit.state.searchQuery,
              onSubmitted: (value) {
                searchCubit.searchByName(value);
              },
            ),
            UIConditional(
                canShow: searchCubit.state.isLoading,
                onBuild: (context) {
                  return Container(margin: const EdgeInsets.only(top: 36), child: const UILoadingIndicator());
                }),
            UIConditional(
                canShow: !searchCubit.state.isLoading,
                onBuild: (context) {
                  return UIResizable(onSize: (screenWidth, _) {
                    return ScreenUtils.calculateGridSize(screenWidth);
                  }, onBuild: (context, size) {
                    int rowsQty = size.toInt();
                    return GridView.builder(
                        gridDelegate: material.SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: rowsQty, crossAxisSpacing: 1.0, mainAxisSpacing: 1.0),
                        primary: false,
                        shrinkWrap: true,
                        itemCount: books.length,
                        itemBuilder: (ctx, index) {
                          Book book = books[index];
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              UIBookCard(
                                id: book.id!,
                                title: book.title,
                                description: book.description ?? '',
                                imageUrl: book.smallThumbnail ?? book.thumbnail ?? '',
                                onPress: (bookId) {
                                  context.push(RouterPaths.getBookDetailsPath(bookId));
                                },
                              ),
                            ],
                          );
                        });
                  });
                }),
            UIConditional(
                canShow: searchUIException is NotFoundException,
                onBuild: (context) {
                  return Container(
                      margin: const EdgeInsets.symmetric(vertical: 36), child: Text(S.of(context).noResults));
                }),
          ],
        ),
      ),
    );
  }
}
