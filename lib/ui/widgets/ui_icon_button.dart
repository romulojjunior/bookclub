import 'package:bookclub/ui/utils/os_selector.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart' as material;

class UIIconButton extends StatelessWidget {
  const UIIconButton(
      {required this.icon, this.secondaryIcon, this.isSelected = false, required this.onPressed, super.key});

  final Widget icon;
  final Widget? secondaryIcon;
  final bool isSelected;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return OSSelector(
      android: material.IconButton(
        icon: isSelected ? (secondaryIcon ?? icon) : icon,
        onPressed: () => onPressed(),
      ),
      iOS: GestureDetector(
        child: isSelected ? (secondaryIcon ?? icon) : icon,
        onTap: () => onPressed(),
      ),
    );
  }
}
