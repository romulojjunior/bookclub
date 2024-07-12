import 'package:flutter/widgets.dart';

class UIConditional extends StatelessWidget {
  final bool canShow;
  final Widget Function(BuildContext) onBuild;
  const UIConditional({super.key, required this.canShow, required this.onBuild});

  @override
  Widget build(BuildContext context) {
    return canShow ? onBuild(context) : Container();
  }
}
