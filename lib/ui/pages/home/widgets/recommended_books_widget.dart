import 'package:bookclub/domain/models/book.dart';
import 'package:bookclub/generated/l10n.dart';
import 'package:bookclub/ui/widgets/ui_book_card.dart';
import 'package:bookclub/ui/widgets/ui_conditional_widget.dart';
import 'package:bookclub/ui/widgets/ui_loading_indicator.dart';
import 'package:bookclub/ui/widgets/ui_page_header.dart';
import 'package:bookclub/ui/widgets/ui_resizable_widget.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';

class RecommendedBooksWidget extends StatelessWidget {
  const RecommendedBooksWidget({required this.isLoading, required this.recommendedBooks, super.key});

  final bool isLoading;
  final List<Book> recommendedBooks;

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
                return _calculateGridSize(screenWidth);
              }, onBuild: (context, size) {
                int rowsQty = size.toInt();
                return GridView.builder(
                    gridDelegate: material.SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: rowsQty, crossAxisSpacing: 1.0, mainAxisSpacing: 1.0),
                    primary: false,
                    shrinkWrap: true,
                    itemCount: recommendedBooks.length,
                    itemBuilder: (ctx, index) {
                      Book book = recommendedBooks[index];
                      return UIBookCard(
                        title: book.title,
                        description: book.description ?? '',
                        imageUrl: book.thumbnail ?? '',
                        onPress: () {},
                      );
                    });
              });
            }),
      ],
    );
  }

  double _calculateGridSize(double screenWidth) {
    if (screenWidth > 600) {
      return 4;
    } else if (screenWidth > 400) {
      return 3;
    } else {
      return 2;
    }
  }
}
