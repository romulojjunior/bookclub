import 'package:bookclub/ui/widgets/ui_loading_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

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
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: imageUrl,
          progressIndicatorBuilder: (context, url, downloadProgress) => const UILoadingIndicator(),
        ),
      ),
    );
  }
}
