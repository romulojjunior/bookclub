import 'package:bookclub/ui/widgets/ui_selector.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/widgets.dart';

class UISearchBar extends StatelessWidget {
  const UISearchBar({this.onChanged, super.key});

  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(16),
        constraints: const BoxConstraints(
          maxWidth: 500,
        ),
        child: UISelector(
          android: material.TextField(
            onChanged: onChanged,
          ),
          iOS: cupertino.CupertinoSearchTextField(
            onChanged: onChanged,
          ),
        ));
  }
}
