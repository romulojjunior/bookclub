import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/cupertino.dart' as cupertino;
import 'package:uikit/widgets/ui_selector.dart';

class UITextField extends StatelessWidget {
  final TextEditingController controller;
  final String? placeholder;
  final void Function(String)? onSubmitted;
  final void Function(String)? onChanged;
  const UITextField({super.key, required this.controller, this.placeholder, this.onChanged, this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return UISelector(
      android: material.TextField(
        controller: controller,
        onSubmitted: onSubmitted,
        onChanged: onChanged,
        decoration: material.InputDecoration(
          border: const material.OutlineInputBorder(),
          hintText: placeholder,
        ),
      ),
      iOS: cupertino.CupertinoTextField(
        padding: const EdgeInsets.all(10),
        controller: controller,
        placeholder: placeholder,
        onSubmitted: onSubmitted,
        onChanged: onChanged,
      ),
    );
  }
}
