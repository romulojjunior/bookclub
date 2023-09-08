import 'package:bookclub/ui/utils/os_selector.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/widgets.dart';

class UISearchBar extends StatelessWidget {
  const UISearchBar({this.onChanged, super.key});

  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints(
          maxWidth: 500,
        ),
        child: OSSelector(
          android: material.SearchBar(
            onChanged: onChanged,
          ),
          iOS: cupertino.CupertinoSearchTextField(
            onChanged: onChanged,
          ),
        ));
  }
}
