import 'package:flutter/widgets.dart';

class UIConditionalWidget extends StatelessWidget {
  const UIConditionalWidget({super.key, required this.canShow, required this.child});

  final bool canShow;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return canShow ? child : Container();
  }
}
