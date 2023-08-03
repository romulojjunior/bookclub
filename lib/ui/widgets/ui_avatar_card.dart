import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UIAvatarCard extends StatelessWidget {
  final int id;
  final String imageUrl;
  final Function(int) onPress;

  const UIAvatarCard({super.key, required this.id, required this.imageUrl, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPress(id),
      child: Container(
          constraints: const BoxConstraints(maxHeight: 100, maxWidth: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipOval(
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(48), // Image radius
                  child: Image.network(imageUrl, fit: BoxFit.cover),
                ),
              ),
            ],
          )),
    );
  }
}
