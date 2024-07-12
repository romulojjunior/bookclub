import 'package:flutter/widgets.dart';

class UIPhotoOpacity extends StatelessWidget {
  const UIPhotoOpacity({required this.child, required this.opacity, super.key});

  final Widget child;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      child,
      Positioned.fill(
        child: Opacity(
          opacity: opacity,
          child: Container(
            color: const Color(0xFF000000),
          ),
        ),
      ),
    ]);
  }
}
