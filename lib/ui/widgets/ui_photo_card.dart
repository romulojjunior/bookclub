import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';

class UIPhotoCard extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final Function onPress;

  const UIPhotoCard(
      {super.key, required this.title, required this.description, required this.imageUrl, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  title,
                  style: const TextStyle(color: material.Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
