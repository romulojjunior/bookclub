import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/cupertino.dart' as cupertino;
import 'package:uikit/widgets/ui_selector.dart';

class UIPasswordField extends StatelessWidget {
  final TextEditingController controller;
  final String? placeholder;
  const UIPasswordField({super.key, required this.controller, this.placeholder});

  @override
  Widget build(BuildContext context) {
    return UISelector(
      android: material.TextField(
        controller: controller,
        obscureText: true,
        enableSuggestions: false,
        autocorrect: false,
        decoration: material.InputDecoration(
          border: const material.OutlineInputBorder(),
          hintText: placeholder,
        ),
      ),
      iOS: cupertino.CupertinoTextField(
        obscureText: true,
        enableSuggestions: false,
        autocorrect: false,
        padding: const EdgeInsets.all(10),
        controller: controller,
        placeholder: placeholder,
      ),
    );
  }
}
