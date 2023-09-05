import 'package:bookclub/domain/models/book.dart';
import 'package:bookclub/ui/widgets/ui_book_card.dart';
import 'package:bookclub/ui/widgets/ui_conditional_widget.dart';
import 'package:bookclub/ui/widgets/ui_loading_indicator.dart';
import 'package:bookclub/ui/widgets/ui_page_header.dart';
import 'package:flutter/widgets.dart';

class BooksWidget extends StatelessWidget {
  const BooksWidget(
      {required this.title, required this.isLoading, required this.books, required this.onBookSelected, super.key});

  final String title;
  final bool isLoading;
  final List<Book> books;
  final Function(String) onBookSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UIPageHeader(title: title),
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
                      itemCount: books.length,
                      separatorBuilder: (ctx, index) => Container(),
                      itemBuilder: (ctx, index) {
                        Book book = books[index];
                        return UIBookCard(
                          id: book.id!,
                          title: book.title,
                          description: book.description ?? '',
                          imageUrl: book.thumbnail ?? '',
                          onPress: (bookId) {
                            onBookSelected(bookId);
                          },
                        );
                      }));
            }),
      ],
    );
  }
}
