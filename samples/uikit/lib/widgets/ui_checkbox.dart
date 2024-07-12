import 'package:flutter/material.dart' as material;
import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/widgets.dart';
import 'package:uikit/widgets/ui_selector.dart';

class UICheckbox extends StatefulWidget {
  const UICheckbox({super.key, required this.onChanged, required this.child});

  final Function(bool?) onChanged;
  final Widget child;

  @override
  State<UICheckbox> createState() => _UICheckboxState();
}

class _UICheckboxState extends State<UICheckbox> {
  late bool? _value = false;

  @override
  Widget build(BuildContext context) {
    return material.Row(
      children: [
        widget.child,
        UISelector(
          android: material.Checkbox(
              value: _value,
              onChanged: (value) {
                widget.onChanged(value);
                setState(() {
                  _value = value;
                });
              }),
          iOS: cupertino.CupertinoCheckbox(
              value: _value,
              onChanged: (value) {
                widget.onChanged(value);
                setState(() {
                  _value = value;
                });
              }),
        ),
      ],
    );
  }
}
