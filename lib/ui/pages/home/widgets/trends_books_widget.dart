import 'package:bookclub/domain/models/book.dart';
import 'package:bookclub/generated/l10n.dart';
import 'package:bookclub/ui/widgets/ui_book_card.dart';
import 'package:bookclub/ui/widgets/ui_conditional_widget.dart';
import 'package:bookclub/ui/widgets/ui_loading_indicator.dart';
import 'package:bookclub/ui/widgets/ui_page_header.dart';
import 'package:flutter/cupertino.dart';

class TrendsBooksWidget extends StatelessWidget {
  const TrendsBooksWidget({required this.isLoading, required this.trendsBooks, super.key});

  final bool isLoading;
  final List<Book> trendsBooks;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UIPageHeader(title: S.of(context).trends),
        UIConditionalWidget(
            canShow: isLoading,
            onBuild: (context) {
              return Container(margin: const EdgeInsets.all(32), child: const UILoadingIndicator());
            }),
        UIConditionalWidget(
            canShow: isLoading == false,
            onBuild: (context) {
              return SizedBox(
                  height: 200,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: trendsBooks.length,
                      separatorBuilder: (ctx, index) => Container(),
                      itemBuilder: (ctx, index) {
                        Book book = trendsBooks[index];
                        return UIBookCard(
                          title: book.title,
                          description: book.description ?? '',
                          imageUrl: book.thumbnail ?? '',
                          onPress: () {},
                        );
                      }));
            }),
      ],
    );
  }
}
