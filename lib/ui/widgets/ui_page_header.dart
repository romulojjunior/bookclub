import 'package:flutter/widgets.dart';

class UIPageHeader extends StatelessWidget {
  final String title;
  const UIPageHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 32),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 36),
          ),
        ],
      ),
    );
  }
}
