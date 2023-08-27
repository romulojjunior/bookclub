import 'package:bookclub/generated/l10n.dart';
import 'package:bookclub/ui/pages/home/tab_favorites.dart';
import 'package:bookclub/ui/pages/home/tab_home.dart';
import 'package:bookclub/ui/pages/home/tab_settings.dart';
import 'package:bookclub/ui/utils/os_selector.dart';
import 'package:bookclub/ui/widgets/ui_tab_scaffold.dart';
import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget homeIcon = const OSSelector(
    android: Icon(material.Icons.home),
    iOS: Icon(cupertino.CupertinoIcons.home),
  );

  Widget favoritesIcon = const OSSelector(
    android: Icon(material.Icons.star),
    iOS: Icon(cupertino.CupertinoIcons.star),
  );

  Widget settingsIcon = const OSSelector(
    android: Icon(material.Icons.settings),
    iOS: Icon(cupertino.CupertinoIcons.settings),
  );

  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = [
      TabHome(title: S.of(context).tab_home),
      FavoritesSettings(title: S.of(context).tab_favorites),
      TabSettings(title: S.of(context).tab_settings)
    ];

    return UITabScaffold(
      bottomNavigationBarItem: [
        BottomNavigationBarItem(
          icon: homeIcon,
          label: S.of(context).tab_home,
        ),
        BottomNavigationBarItem(
          icon: favoritesIcon,
          label: S.of(context).tab_favorites,
        ),
        BottomNavigationBarItem(
          icon: settingsIcon,
          label: S.of(context).tab_settings,
        ),
      ],
      onTabSelected: (index) {
        return tabs[index];
      },
    );
  }
}
