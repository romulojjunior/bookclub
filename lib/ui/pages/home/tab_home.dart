import 'package:bookclub/domain/models/book.dart';
import 'package:bookclub/domain/models/user.dart';
import 'package:bookclub/generated/l10n.dart';
import 'package:bookclub/ui/state/books_bloc/books_bloc.dart';
import 'package:bookclub/ui/widgets/ui_book_card.dart';
import 'package:bookclub/ui/widgets/ui_conditional_widget.dart';
import 'package:bookclub/ui/widgets/ui_page_header.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/ui_avatar_card.dart';

class TabHome extends StatelessWidget {
  final String title;
  const TabHome({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    List<User> users = User.sample();
    List<Book> recommendedBooks = context.watch<BooksBloc>().state.recommended;
    List<Book> trendsBooks = context.watch<BooksBloc>().state.trends;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            UIPageHeader(title: title),
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: SizedBox(
                  height: 160,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: users.length,
                      separatorBuilder: (ctx, index) => const material.Divider(),
                      itemBuilder: (ctx, index) {
                        User user = users[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Hero(
                                tag: 'Avatar${user.id}',
                                child: UIAvatarCard(
                                  id: user.id ?? 0,
                                  imageUrl: user.avatarUrl,
                                  onPress: (id) async {
                                    context.go('/profiles/${user.id}');
                                  },
                                ),
                              ),
                              Container(margin: const EdgeInsets.all(8), child: Text(user.name))
                            ],
                          ),
                        );
                      })),
            ),
            UIPageHeader(title: S.of(context).trends),
            SizedBox(
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
                    })),
            UIPageHeader(title: S.of(context).recommended),
            UIConditionalWidget(
                canShow: MediaQuery.of(context).size.width <= 600,
                onBuild: (context) {
                  return GridView.builder(
                      gridDelegate: const material.SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, crossAxisSpacing: 1.0, mainAxisSpacing: 1.0),
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
                }),
            UIConditionalWidget(
                canShow: MediaQuery.of(context).size.width > 600,
                onBuild: (context) {
                  return GridView.builder(
                      gridDelegate: const material.SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4, crossAxisSpacing: 1.0, mainAxisSpacing: 1.0),
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
                }),
          ],
        ),
      ),
    );
  }
}
