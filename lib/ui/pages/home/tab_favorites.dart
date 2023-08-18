import 'package:bookclub/domain/models/writer.dart';
import 'package:bookclub/ui/router.dart';
import 'package:bookclub/ui/state/favorites_cubit/favorites_cubit.dart';
import 'package:bookclub/ui/widgets/ui_avatar_card.dart';
import 'package:bookclub/ui/widgets/ui_page_header.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FavoritesSettings extends StatelessWidget {
  final String title;
  const FavoritesSettings({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    FavoritesCubit favoritesCubit = context.watch<FavoritesCubit>();
    List<Writer> favoriteWriters = favoritesCubit.state.writers;

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            UIPageHeader(title: title),
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
                      Text(writer.name)
                    ],
                  );
                })
          ],
        ),
      ),
    );
  }
}
