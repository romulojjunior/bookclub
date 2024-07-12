import 'package:flutter/cupertino.dart';

class UIResizable extends StatelessWidget {
  const UIResizable({required this.onSize, required this.onBuild, super.key});

  final double Function(double screenWidth, double screenHeight) onSize;
  final Widget Function(BuildContext, double size) onBuild;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double size = onSize(screenWidth, screenHeight);
    return onBuild(context, size);
  }
}
