import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/material.dart' as material;
import 'package:uikit/widgets/ui_selector.dart';

class UIScaffold extends StatelessWidget {
  const UIScaffold({super.key, required this.child, this.title, this.actions});

  final String? title;
  final Widget child;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return UISelector(
      android: material.Scaffold(
        appBar: (title != null)
            ? material.AppBar(
                title: Text(title ?? ''),
                actions: actions,
              )
            : null,
        body: child,
      ),
      iOS: cupertino.CupertinoPageScaffold(
        navigationBar: (title != null)
            ? cupertino.CupertinoNavigationBar(
                automaticallyImplyLeading: false,
                middle: Text(title ?? ''),
                trailing: (actions != null) ? Row(mainAxisSize: MainAxisSize.min, children: actions!) : null)
            : null,
        child: child,
      ),
    );
  }
}
