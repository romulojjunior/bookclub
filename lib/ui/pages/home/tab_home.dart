import 'package:bookclub/domain/models/photo.dart';
import 'package:bookclub/domain/models/user.dart';
import 'package:bookclub/ui/widgets/ui_conditional_widget.dart';
import 'package:bookclub/ui/widgets/ui_page_header.dart';
import 'package:bookclub/ui/widgets/ui_photo_card.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/ui_avatar_card.dart';

class TabHome extends StatelessWidget {
  final String title;
  const TabHome({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    List<Photo> photos = Photo.getSample();
    List<User> users = User.sample();
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
                                  onPress: (id) {
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
            SizedBox(
                height: 200,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: photos.length,
                    separatorBuilder: (ctx, index) => Container(),
                    itemBuilder: (ctx, index) {
                      Photo photo = photos[index];
                      return UIPhotoCard(
                        title: photo.title,
                        description: photo.description,
                        imageUrl: photo.url,
                        onPress: () {},
                      );
                    })),
            UIConditionalWidget(
                canShow: MediaQuery.of(context).size.width <= 600,
                onBuild: (context) {
                  return ListView.separated(
                      primary: false,
                      shrinkWrap: true,
                      itemCount: photos.length,
                      separatorBuilder: (ctx, index) => Container(),
                      itemBuilder: (ctx, index) {
                        Photo photo = photos[index];
                        return UIPhotoCard(
                          title: photo.title,
                          description: photo.description,
                          imageUrl: photo.url,
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
                      itemCount: photos.length,
                      itemBuilder: (ctx, index) {
                        Photo photo = photos[index];
                        return UIPhotoCard(
                          title: photo.title,
                          description: photo.description,
                          imageUrl: photo.url,
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
