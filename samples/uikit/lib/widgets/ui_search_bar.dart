import 'package:flutter/material.dart' as material;
import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/widgets.dart';
import 'package:uikit/widgets/ui_selector.dart';

class UISearchBar extends StatefulWidget {
  const UISearchBar({this.initialValue, this.onChanged, this.onSubmitted, super.key});

  final String? initialValue;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;

  @override
  State<UISearchBar> createState() => _UISearchBarState();
}

class _UISearchBarState extends State<UISearchBar> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController.fromValue(TextEditingValue(text: widget.initialValue ?? ''));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return UISelector(
      android: material.TextField(
        key: const ValueKey('SearchTextFiled'),
        controller: _controller,
        onChanged: widget.onChanged,
        onSubmitted: widget.onSubmitted,
      ),
      iOS: cupertino.CupertinoSearchTextField(
        padding: const EdgeInsets.all(16),
        prefixInsets: const EdgeInsets.only(left: 16.0),
        suffixInsets: const EdgeInsets.only(right: 16.0),
        controller: _controller,
        onChanged: widget.onChanged,
        onSubmitted: widget.onSubmitted,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
