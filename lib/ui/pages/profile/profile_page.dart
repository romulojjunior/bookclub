import 'package:bookclub/domain/models/book.dart';
import 'package:bookclub/generated/l10n.dart';
import 'package:bookclub/ui/state/books_bloc/books_bloc.dart';
import 'package:bookclub/ui/widgets/books_widget.dart';
import 'package:bookclub/ui/widgets/ui_alert_dialog.dart';
import 'package:bookclub/ui/widgets/ui_avatar_card.dart';
import 'package:bookclub/ui/widgets/ui_button.dart';
import 'package:bookclub/ui/widgets/ui_scaffold.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';

import 'package:bookclub/domain/models/photo.dart';
import 'package:bookclub/domain/models/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {
  final int userId;
  const ProfilePage({super.key, required this.userId});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    List<Photo> photos = Photo.getSample();
    List<User> users = User.sample();
    User user = users.firstWhere((user) => user.id == widget.userId);
    Photo userBackgroundPhoto = photos[user.id!];

    List<Book> trendsBooks = context.watch<BooksBloc>().state.trends;
    bool isTrendsLoading = context.watch<BooksBloc>().state.isTrendsLoading;

    return UIScaffold(
        title: 'Profile',
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 400,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          constraints: const BoxConstraints.expand(height: 200),
                          color: material.Colors.redAccent,
                          child: Image.network(
                            userBackgroundPhoto.url,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          constraints: const BoxConstraints.expand(height: 200),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  margin: const EdgeInsets.only(top: 32),
                                  child: Text(
                                    user.name,
                                    style: const TextStyle(fontSize: 24),
                                  )),
                              Container(margin: const EdgeInsets.only(top: 8), child: const Text('32,383 Followers')),
                              Container(
                                  margin: const EdgeInsets.only(top: 16),
                                  child: UIButton(
                                      title: 'Follow',
                                      onPressed: () {
                                        UIAlertDialog(
                                          title: 'Follow',
                                          message: 'Would you like follow this user?',
                                          onSuccess: () => Navigator.of(context).pop(),
                                          onCancel: () => Navigator.of(context).pop(),
                                        ).showDialog(context);
                                      }))
                            ],
                          ),
                        ),
                      ),
                      Align(
                        child: Container(
                          margin: const EdgeInsets.only(left: 16),
                          height: 200,
                          alignment:
                              (MediaQuery.of(context).size.width > 600) ? Alignment.center : Alignment.centerLeft,
                          child: Hero(
                            tag: 'Avatar${user.id}',
                            child: UIAvatarCard(
                              id: user.id!,
                              imageUrl: user.avatarUrl,
                              onPress: (id) {},
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  constraints: const BoxConstraints(maxWidth: 400),
                  margin: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                  child: Text(user.aboutMe),
                ),
                BooksWidget(
                  title: S.of(context).books,
                  isLoading: isTrendsLoading,
                  trendsBooks: trendsBooks,
                ),
              ],
            ),
          ),
        ));
  }
}
