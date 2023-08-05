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
  final List<Widget> tabs = const [TabHome(title: 'Home'), TabSettings(title: 'Settings')];

  Widget homeIcon = const OSSelector(
    android: Icon(material.Icons.home),
    iOS: Icon(cupertino.CupertinoIcons.home),
  );

  Widget settingsIcon = const OSSelector(
    android: Icon(material.Icons.settings),
    iOS: Icon(cupertino.CupertinoIcons.settings),
  );

  @override
  Widget build(BuildContext context) {
    return UITabScaffold(
      bottomNavigationBarItem: [
        BottomNavigationBarItem(
          icon: homeIcon,
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: settingsIcon,
          label: 'Settings',
        ),
      ],
      onTabSelected: (index) {
        return tabs[index];
      },
    );
  }
}
