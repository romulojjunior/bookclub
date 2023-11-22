import 'package:bookclub/ui/widgets/ui_selector.dart';
import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';

class UIButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;

  const UIButton({super.key, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return UISelector(
      android: material.FilledButton(onPressed: onPressed, child: Text(title)),
      iOS: cupertino.CupertinoButton.filled(
        onPressed: onPressed,
        child: Text(title),
      ),
    );
  }
}
