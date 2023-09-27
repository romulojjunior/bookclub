import 'package:bookclub/domain/models/book.dart';
import 'package:bookclub/domain/models/writer.dart';
import 'package:bookclub/generated/l10n.dart';
import 'package:bookclub/ui/router.dart';
import 'package:bookclub/ui/state/favorites_cubit/favorites_cubit.dart';
import 'package:bookclub/ui/widgets/ui_avatar_card.dart';
import 'package:bookclub/ui/widgets/ui_book_card.dart';
import 'package:bookclub/ui/widgets/ui_page_header.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FavoritesSettings extends material.StatefulWidget {
  final String title;
  const FavoritesSettings({super.key, required this.title});

  @override
  State<FavoritesSettings> createState() => _FavoritesSettingsState();
}

class _FavoritesSettingsState extends material.State<FavoritesSettings> {
  final List<bool> _selectedMenuOptions = <bool>[true, false]; // Writers | Books

  @override
  Widget build(BuildContext context) {
    FavoritesCubit favoritesCubit = context.watch<FavoritesCubit>();
    List<Writer> favoriteWriters = favoritesCubit.state.writers;
    List<Book> favoriteBooks = favoritesCubit.state.books;
    const List<Widget> menuOptions = <Widget>[Text('Writers'), Text('Books')];

    List<Widget> body = [];

    body.add(Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: material.ToggleButtons(
        direction: Axis.horizontal,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        constraints: const BoxConstraints(
          minHeight: 40.0,
          minWidth: 80.0,
        ),
        color: material.Colors.grey,
        isSelected: _selectedMenuOptions,
        onPressed: (int index) {
          setState(() {
            for (int i = 0; i < _selectedMenuOptions.length; i++) {
              _selectedMenuOptions[i] = i == index;
            }
          });
        },
        children: menuOptions,
      ),
    ));

    // Add Writers Grid
    bool shouldShowWriters = _selectedMenuOptions[0] == true;
    if (shouldShowWriters) {
      body.add(
        GridView.builder(
            gridDelegate: const material.SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, crossAxisSpacing: 1.0, mainAxisSpacing: 1.0),
            primary: false,
            shrinkWrap: true,
            itemCount: favoriteWriters.length,
            itemBuilder: (ctx, index) {
              Writer writer = favoriteWriters[index];
              return Column(
                children: [
                  Hero(
                    tag: 'Avatar${writer.id}',
                    child: UIAvatarCard(
                        id: writer.id ?? 0,
                        imageUrl: writer.avatarUrl,
                        onPress: (id) {
                          context.go(RouterPaths.getWriterDetailsPath(id));
                        }),
                  ),
                  Text(
                    writer.name,
                    style: const TextStyle(fontSize: 14),
                  )
                ],
              );
            }),
      );
    }

    // Add Books Grid
    bool shouldShowBooks = _selectedMenuOptions[1] == true;
    if (shouldShowBooks) {
      body.add(GridView.builder(
          primary: false,
          shrinkWrap: true,
          gridDelegate: const material.SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, crossAxisSpacing: 1.0, mainAxisSpacing: 1.0),
          itemCount: favoriteBooks.length,
          itemBuilder: (ctx, index) {
            Book book = favoriteBooks[index];
            return material.Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UIBookCard(
                    id: book.id ?? '',
                    title: book.title,
                    description: book.description ?? '',
                    imageUrl: book.smallThumbnail ?? '',
                    onPress: (id) {
                      context.go(RouterPaths.getBookDetailsPath(id));
                    }),
              ],
            );
          }));
    }

    // No favorites message
    Widget noFavorites =
        Container(constraints: const BoxConstraints(minHeight: 300), child: Center(child: Text(S.of(context).empty)));

    if (shouldShowWriters && favoriteWriters.isEmpty) {
      body.add(noFavorites);
    }

    if (shouldShowBooks && favoriteBooks.isEmpty) {
      body.add(noFavorites);
    }

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            UIPageHeader(title: widget.title),
            material.Container(constraints: const BoxConstraints(maxWidth: 1024), child: Column(children: body))
          ],
        ),
      ),
    );
  }
}
