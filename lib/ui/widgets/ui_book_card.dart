import 'package:bookclub/ui/widgets/ui_loading_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';

class UIBookCard extends StatelessWidget {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final Function onPress;

  const UIBookCard(
      {required this.id,
      required this.title,
      required this.description,
      required this.imageUrl,
      required this.onPress,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress(id);
      },
      child: Column(
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5.0))),
            margin: const EdgeInsets.all(8),
            child: CachedNetworkImage(
              height: 150,
              width: 100,
              fit: BoxFit.cover,
              imageUrl: imageUrl,
              progressIndicatorBuilder: (context, url, downloadProgress) => const UILoadingIndicator(),
              errorWidget: (context, url, error) {
                return Container(color: material.Colors.grey);
              },
            ),
          ),
          SizedBox(
            width: 100,
            child: Text(
              title,
              style: const TextStyle(fontSize: 12),
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
