import 'package:bookclub/ui/utils/os_selector.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart' as material;

class UIIconButton extends StatefulWidget {
  const UIIconButton(
      {required this.icon, this.secondaryIcon, this.isSelected = false, required this.onPressed, super.key});

  final Widget icon;
  final Widget? secondaryIcon;
  final bool isSelected;
  final Function(bool) onPressed;

  @override
  State<UIIconButton> createState() => _UIIconButtonState();
}

class _UIIconButtonState extends State<UIIconButton> {
  bool _isSelected = false;
  @override
  void initState() {
    super.initState();
    _isSelected = widget.isSelected;
  }

  @override
  Widget build(BuildContext context) {
    return OSSelector(
      android: material.IconButton(
        icon: _isSelected ? (widget.secondaryIcon ?? widget.icon) : widget.icon,
        onPressed: _onIconPressed,
      ),
      iOS: GestureDetector(
        onTap: _onIconPressed,
        child: widget.isSelected ? (widget.secondaryIcon ?? widget.icon) : widget.icon,
      ),
    );
  }

  _onIconPressed() {
    widget.onPressed(!_isSelected);
    setState(() {
      _isSelected = !_isSelected;
    });
  }
}
