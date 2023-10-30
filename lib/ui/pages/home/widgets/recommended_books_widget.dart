import 'package:bookclub/domain/models/book.dart';
import 'package:bookclub/generated/l10n.dart';
import 'package:bookclub/ui/utils/screen_utils.dart';
import 'package:bookclub/ui/widgets/ui_book_card.dart';
import 'package:bookclub/ui/widgets/ui_conditional_widget.dart';
import 'package:bookclub/ui/widgets/ui_loading_indicator.dart';
import 'package:bookclub/ui/widgets/ui_page_header.dart';
import 'package:bookclub/ui/widgets/ui_resizable_widget.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';

class RecommendedBooksWidget extends StatelessWidget {
  const RecommendedBooksWidget(
      {required this.isLoading, required this.recommendedBooks, required this.onBookSelected, super.key});

  final bool isLoading;
  final List<Book> recommendedBooks;
  final Function(String) onBookSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UIPageHeader(title: S.of(context).recommended),
        UIConditionalWidget(
            canShow: isLoading,
            onBuild: (context) {
              return Container(margin: const EdgeInsets.all(32), child: const UILoadingIndicator());
            }),
        UIConditionalWidget(
            canShow: isLoading == false,
            onBuild: (context) {
              return UIResizableWidget(onSize: (screenWidth, _) {
                return ScreenUtils.calculateGridSize(screenWidth);
              }, onBuild: (context, size) {
                int rowsQty = size.toInt();
                return GridView.builder(
                    gridDelegate: material.SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: rowsQty),
                    primary: false,
                    shrinkWrap: true,
                    itemCount: recommendedBooks.length,
                    itemBuilder: (ctx, index) {
                      Book book = recommendedBooks[index];
                      return material.Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          UIBookCard(
                            id: book.id!,
                            title: book.title,
                            description: book.description ?? '',
                            imageUrl: book.thumbnail ?? '',
                            onPress: (bookId) {
                              onBookSelected(bookId);
                            },
                          ),
                        ],
                      );
                    });
              });
            }),
      ],
    );
  }
}
