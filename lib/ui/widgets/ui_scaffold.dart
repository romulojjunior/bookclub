import 'package:bookclub/ui/utils/os_selector.dart';
import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';

class UIScaffold extends StatelessWidget {
  final String? title;
  final Widget child;
  const UIScaffold({super.key, required this.child, this.title});

  @override
  Widget build(BuildContext context) {
    return OSSelector(
      android: material.Scaffold(
        appBar: material.AppBar(
          title: Text(title ?? ''),
        ),
        body: child,
      ),
      iOS: cupertino.CupertinoPageScaffold(
        navigationBar: cupertino.CupertinoNavigationBar(
          middle: Text(title ?? ""),
        ),
        child: child,
      ),
    );
  }
}
