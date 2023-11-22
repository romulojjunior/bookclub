import 'package:bookclub/ui/widgets/ui_selector.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/cupertino.dart' as cupertino;

class UITextField extends StatelessWidget {
  final TextEditingController controller;
  final String? placeholder;
  const UITextField({super.key, required this.controller, this.placeholder});

  @override
  Widget build(BuildContext context) {
    return UISelector(
      android: material.TextField(
        controller: controller,
        decoration: material.InputDecoration(
          border: const material.OutlineInputBorder(),
          hintText: placeholder,
        ),
      ),
      iOS: cupertino.CupertinoTextField(
        padding: const EdgeInsets.all(16),
        controller: controller,
        placeholder: placeholder,
      ),
    );
  }
}
