import 'package:bookclub/domain/entities/book.dart';
import 'package:bookclub/ui/router.dart';
import 'package:bookclub/ui/state/search_cubit/search_cubit.dart';
import 'package:bookclub/ui/utils/screen_utils.dart';
import 'package:bookclub/ui/widgets/ui_book_card.dart';
import 'package:bookclub/ui/widgets/ui_conditional_widget.dart';
import 'package:bookclub/ui/widgets/ui_page_header.dart';
import 'package:bookclub/ui/widgets/ui_resizable_widget.dart';
import 'package:bookclub/ui/widgets/ui_search_bar.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class TabSearch extends StatelessWidget {
  final String title;
  const TabSearch({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    SearchCubit searchCubit = context.watch<SearchCubit>();
    List<Book> books = searchCubit.state.books;

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            UIPageHeader(title: title),
            UISearchBar(
              onChanged: (value) {
                searchCubit.searchByName(value);
              },
            ),
            UIConditionalWidget(
                canShow: !searchCubit.state.isLoading,
                onBuild: (context) {
                  return UIResizableWidget(onSize: (screenWidth, _) {
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
          ],
        ),
      ),
    );
  }
}
