import 'package:bookclub/ui/widgets/ui_selector.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/widgets.dart';

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
    return Container(
        margin: const EdgeInsets.all(16),
        constraints: const BoxConstraints(
          maxWidth: 500,
        ),
        child: UISelector(
          android: material.TextField(
            key: const ValueKey('SearchTextFiled'),
            controller: _controller,
            onChanged: widget.onChanged,
            onSubmitted: widget.onSubmitted,
          ),
          iOS: cupertino.CupertinoSearchTextField(
            controller: _controller,
            onChanged: widget.onChanged,
            onSubmitted: widget.onSubmitted,
          ),
        ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
