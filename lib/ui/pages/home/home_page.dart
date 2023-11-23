import 'package:bookclub/generated/l10n.dart';
import 'package:bookclub/ui/pages/home/tab_favorites.dart';
import 'package:bookclub/ui/pages/home/tab_home.dart';
import 'package:bookclub/ui/pages/home/tab_search.dart';
import 'package:bookclub/ui/pages/home/tab_settings.dart';
import 'package:bookclub/ui/widgets/ui_selector.dart';
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
  List<Widget> tabs = [];

  Widget homeIcon = const UISelector(
    android: Icon(material.Icons.home),
    iOS: Icon(cupertino.CupertinoIcons.home),
  );

  Widget favoritesIcon = const UISelector(
    android: Icon(material.Icons.star),
    iOS: Icon(cupertino.CupertinoIcons.star),
  );

  Widget searchIcon = const UISelector(
    android: Icon(material.Icons.search),
    iOS: Icon(cupertino.CupertinoIcons.search),
  );

  Widget settingsIcon = const UISelector(
    android: Icon(material.Icons.settings),
    iOS: Icon(cupertino.CupertinoIcons.settings),
  );

  @override
  Widget build(BuildContext context) {
    if (tabs.isEmpty) {
      tabs = [
        TabHome(title: S.of(context).tab_home),
        TabSearch(title: S.of(context).tab_search),
        FavoritesSettings(title: S.of(context).tab_favorites),
        TabSettings(title: S.of(context).tab_settings)
      ];
    }

    return UITabScaffold(
      bottomNavigationBarItem: [
        BottomNavigationBarItem(
          icon: homeIcon,
          label: S.of(context).tab_home,
        ),
        BottomNavigationBarItem(
          icon: searchIcon,
          label: S.of(context).tab_search,
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
