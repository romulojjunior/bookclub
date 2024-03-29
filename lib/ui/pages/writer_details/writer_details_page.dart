import 'package:bookclub/domain/entities/book.dart';
import 'package:bookclub/generated/l10n.dart';
import 'package:bookclub/ui/router.dart';
import 'package:bookclub/ui/state/books_bloc/books_bloc.dart';
import 'package:bookclub/ui/state/favorites_cubit/favorites_cubit.dart';
import 'package:bookclub/ui/state/writers_cubit/writers_cubit.dart';
import 'package:bookclub/ui/widgets/ui_selector.dart';
import 'package:bookclub/ui/widgets/ui_books.dart';
import 'package:bookclub/ui/widgets/ui_start_rate.dart';
import 'package:bookclub/ui/widgets/ui_alert_dialog.dart';
import 'package:bookclub/ui/widgets/ui_avatar_card.dart';
import 'package:bookclub/ui/widgets/ui_button.dart';
import 'package:bookclub/ui/widgets/ui_icon_button.dart';
import 'package:bookclub/ui/widgets/ui_photo_opacity.dart';
import 'package:bookclub/ui/widgets/ui_scaffold.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/widgets.dart';
import 'package:bookclub/domain/entities/writer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class WriterDetailsPage extends StatefulWidget {
  const WriterDetailsPage({super.key, required this.userId});

  final int userId;

  @override
  State<WriterDetailsPage> createState() => _WriterDetailsPageState();
}

class _WriterDetailsPageState extends State<WriterDetailsPage> {
  late Writer _writer;

  @override
  void initState() {
    _writer = context.read<WritersCubit>().state.writers.firstWhere((user) => user.id == widget.userId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BooksBloc booksBloc = context.watch<BooksBloc>();
    List<Book> trendsBooks = booksBloc.state.trends;
    bool isTrendsLoading = booksBloc.state.isTrendsLoading;

    return UIScaffold(
        title: S.of(context).writer,
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
                              child: Image.network(
                                _writer.imageCoverUrl,
                                fit: BoxFit.cover,
                                errorBuilder: (_, __, ___) {
                                  return Container(color: material.Colors.black);
                                },
                              )),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: material.Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: UIIconButton(
                              icon: const UISelector(
                                android: Icon(material.Icons.star_border, color: material.Colors.deepOrange),
                                iOS: Icon(cupertino.CupertinoIcons.star, color: material.Colors.deepOrange),
                              ),
                              secondaryIcon: const UISelector(
                                android: Icon(material.Icons.star, color: material.Colors.deepOrange),
                                iOS: Icon(cupertino.CupertinoIcons.star_fill, color: material.Colors.deepOrange),
                              ),
                              isSelected: context.watch<FavoritesCubit>().isFavoriteWriter(_writer),
                              onPressed: (isSelected) {
                                isSelected
                                    ? context.read<FavoritesCubit>().addWriter(_writer)
                                    : context.read<FavoritesCubit>().removeWriter(_writer.id!);
                              }),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: material.Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            _writer.name,
                            style: const TextStyle(fontSize: 36, color: material.Colors.white),
                          ),
                        ),
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
                                child: Text(S.of(context).nFollower(_writer.followers),
                                    style: const TextStyle(fontSize: 14, color: material.Colors.white)),
                              ),
                              Container(
                                  constraints: const BoxConstraints(maxWidth: 300),
                                  margin: const EdgeInsets.only(top: 8),
                                  child: const UIStarRate()),
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
                            tag: UIAvatarCard.getHeroTag(_writer.id),
                            child: UIAvatarCard(
                              id: _writer.id!,
                              imageUrl: _writer.avatarUrl,
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
                              Text(_writer.aboutMe, style: const TextStyle(fontSize: 14, color: material.Colors.white)),
                        ),
                      )
                    ],
                  ),
                ),
                UIBooks(
                  title: S.of(context).books,
                  isLoading: isTrendsLoading,
                  books: trendsBooks,
                  onBookSelected: (bookId) {
                    context.push(RouterPaths.getBookDetailsPath(bookId));
                  },
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
}
