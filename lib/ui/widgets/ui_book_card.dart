import 'package:flutter/widgets.dart';

class UIBookCard extends StatelessWidget {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final Function onPress;

  const UIBookCard(
      {super.key,
      required this.id,
      required this.title,
      required this.description,
      required this.imageUrl,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress(id);
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
