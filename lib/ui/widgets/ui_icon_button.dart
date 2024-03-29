import 'package:bookclub/ui/widgets/ui_selector.dart';
import 'package:flutter/widgets.dart';

class UIIconButton extends StatefulWidget {
  const UIIconButton({super.key, required this.icon, this.secondaryIcon, this.isSelected = false, this.onPressed});

  final Widget icon;
  final Widget? secondaryIcon;
  final bool isSelected;
  final Function(bool)? onPressed;

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
    return UISelector(
      android: GestureDetector(
        onTap: _onIconPressed,
        child: _isSelected ? (widget.secondaryIcon ?? widget.icon) : widget.icon,
      ),
      iOS: GestureDetector(
        onTap: _onIconPressed,
        child: widget.isSelected ? (widget.secondaryIcon ?? widget.icon) : widget.icon,
      ),
    );
  }

  _onIconPressed() {
    widget.onPressed?.call(!_isSelected);
    setState(() {
      _isSelected = !_isSelected;
    });
  }
}
