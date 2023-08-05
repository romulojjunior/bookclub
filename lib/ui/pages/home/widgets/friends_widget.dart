import 'package:bookclub/domain/models/user.dart';
import 'package:bookclub/generated/l10n.dart';
import 'package:bookclub/ui/widgets/ui_avatar_card.dart';
import 'package:bookclub/ui/widgets/ui_page_header.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart' as material;
import 'package:go_router/go_router.dart';

class FriendsWidget extends StatelessWidget {
  const FriendsWidget({required this.friends, super.key});

  final List<User> friends;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UIPageHeader(title: S.of(context).friends),
        Container(
          margin: const EdgeInsets.only(top: 16),
          child: SizedBox(
              height: 160,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: friends.length,
                  separatorBuilder: (ctx, index) => const material.Divider(),
                  itemBuilder: (ctx, index) {
                    User user = friends[index];
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
      ],
    );
  }
}
