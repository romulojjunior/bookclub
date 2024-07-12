import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';
import 'package:uikit/widgets/ui_selector.dart';

class UICard extends StatelessWidget {
  const UICard({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return UISelector(
      android: UICardAndroid(
        child: child,
      ),
      iOS: UICardIOS(child: child),
    );
  }
}

class UICardAndroid extends StatelessWidget {
  const UICardAndroid({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    const borderRadiusSize = 8.0;
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(borderRadiusSize), boxShadow: [
        BoxShadow(color: material.Colors.grey.withOpacity(0.2), spreadRadius: 1.0, offset: const Offset(0.5, 0.5))
      ]),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(borderRadiusSize)),
        child: Container(
          decoration: BoxDecoration(
            color: material.Theme.of(context).colorScheme.background,
            borderRadius: BorderRadius.circular(borderRadiusSize),
          ),
          child: child,
        ),
      ),
    );
  }
}

class UICardIOS extends StatelessWidget {
  const UICardIOS({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    const borderRadiusSize = 8.0;
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(borderRadiusSize), boxShadow: [
        BoxShadow(
            color: cupertino.CupertinoColors.systemGrey.withOpacity(0.2),
            spreadRadius: 1.0,
            offset: const Offset(0.5, 0.5))
      ]),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(borderRadiusSize)),
        child: Container(
          decoration: BoxDecoration(
            color: cupertino.CupertinoTheme.of(context).primaryContrastingColor,
            borderRadius: BorderRadius.circular(borderRadiusSize),
          ),
          child: child,
        ),
      ),
    );
  }
}
