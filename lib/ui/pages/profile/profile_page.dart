import 'package:bookclub/domain/models/book.dart';
import 'package:bookclub/generated/l10n.dart';
import 'package:bookclub/ui/state/books_bloc/books_bloc.dart';
import 'package:bookclub/ui/state/favorites_cubit/favorites_cubit.dart';
import 'package:bookclub/ui/utils/os_selector.dart';
import 'package:bookclub/ui/widgets/books_widget.dart';
import 'package:bookclub/ui/widgets/start_rate_widget.dart';
import 'package:bookclub/ui/widgets/ui_alert_dialog.dart';
import 'package:bookclub/ui/widgets/ui_avatar_card.dart';
import 'package:bookclub/ui/widgets/ui_button.dart';
import 'package:bookclub/ui/widgets/ui_icon_button.dart';
import 'package:bookclub/ui/widgets/ui_photo_opacity.dart';
import 'package:bookclub/ui/widgets/ui_scaffold.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/widgets.dart';
import 'package:bookclub/domain/models/photo.dart';
import 'package:bookclub/domain/models/writer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {
  final int userId;
  const ProfilePage({super.key, required this.userId});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Writer writer;
  late Photo userBackgroundPhoto;
  List<Photo> photos = Photo.getSample();
  List<Writer> users = Writer.sample();

  // TODO: Load this flag from FavoritesCubit.isFavorite(writer);
  bool isFavoriteEnabled = false;

  @override
  void initState() {
    super.initState();
    writer = users.firstWhere((user) => user.id == widget.userId);
    userBackgroundPhoto = photos[writer.id!];
  }

  @override
  Widget build(BuildContext context) {
    BooksBloc booksBloc = context.watch<BooksBloc>();
    List<Book> trendsBooks = booksBloc.state.trends;
    bool isTrendsLoading = booksBloc.state.isTrendsLoading;

    return UIScaffold(
        title: writer.name,
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
                        child: UIPhotoOpacity(
                          opacity: 0.4,
                          child: Container(
                              constraints: const BoxConstraints.expand(height: 400),
                              color: material.Colors.redAccent,
                              child: Image.network(
                                userBackgroundPhoto.url,
                                fit: BoxFit.cover,
                              )),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: UIIconButton(
                            icon: const OSSelector(
                              android: Icon(material.Icons.star_border),
                              iOS: Icon(cupertino.CupertinoIcons.star),
                            ),
                            secondaryIcon: const OSSelector(
                              android: Icon(material.Icons.star),
                              iOS: Icon(cupertino.CupertinoIcons.star_fill),
                            ),
                            isSelected: isFavoriteEnabled,
                            onPressed: () {
                              _setFavorite(isFavoriteEnabled);
                            }),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          margin: const EdgeInsets.only(right: 16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 8),
                                child: Text(S.of(context).nFollower(writer.followers),
                                    style: const TextStyle(fontSize: 14, color: material.Colors.white)),
                              ),
                              Container(
                                  constraints: const BoxConstraints(maxWidth: 300),
                                  margin: const EdgeInsets.only(top: 8),
                                  child: const StarRateWidget()),
                              Container(
                                  margin: const EdgeInsets.only(top: 32),
                                  child: UIButton(title: S.of(context).following, onPressed: _showDialog))
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
                            tag: 'Avatar${writer.id}',
                            child: UIAvatarCard(
                              id: writer.id!,
                              imageUrl: writer.avatarUrl,
                              onPress: (id) {},
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          constraints: const BoxConstraints(maxWidth: 400),
                          margin: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                          child:
                              Text(writer.aboutMe, style: const TextStyle(fontSize: 14, color: material.Colors.white)),
                        ),
                      )
                    ],
                  ),
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

  _showDialog() {
    UIAlertDialog(
      title: S.of(context).following,
      message: S.of(context).wouldYouLikeUnfollow,
      onSuccess: () {},
      onCancel: () {},
    ).showDialog(context);
  }

  _setFavorite(bool isSelected) {
    context.read<FavoritesCubit>().favoriteWriter(writer);
    setState(() {
      isFavoriteEnabled = !isSelected;
    });
  }
}
