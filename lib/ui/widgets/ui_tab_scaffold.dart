import 'package:bookclub/ui/utils/os_selector.dart';
import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';

class UITabScaffold extends StatefulWidget {
  final String? title;
  final List<BottomNavigationBarItem> bottomNavigationBarItem;
  final Widget Function(int index) onTabSelected;
  const UITabScaffold({super.key, this.title, required this.bottomNavigationBarItem, required this.onTabSelected});

  @override
  State<UITabScaffold> createState() => _UITabScaffoldState();
}

class _UITabScaffoldState extends State<UITabScaffold> {
  int tabIdex = 0;

  @override
  Widget build(BuildContext context) {
    return OSSelector(
      android: material.Scaffold(
        appBar: widget.title != null
            ? material.AppBar(
                title: Text(widget.title ?? ''),
              )
            : null,
        body: widget.onTabSelected(tabIdex),
        bottomNavigationBar: material.BottomNavigationBar(
          currentIndex: tabIdex,
          type: material.BottomNavigationBarType.fixed,
          items: widget.bottomNavigationBarItem,
          onTap: (index) {
            setState(() {
              tabIdex = index;
            });
          },
        ),
      ),
      iOS: cupertino.CupertinoTabScaffold(
        tabBar: cupertino.CupertinoTabBar(
          items: widget.bottomNavigationBarItem,
        ),
        tabBuilder: (context, index) {
          return widget.onTabSelected(index);
        },
      ),
    );
  }
}
