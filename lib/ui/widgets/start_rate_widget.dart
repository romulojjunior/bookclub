import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';

class StarRateWidget extends StatelessWidget {
  const StarRateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          material.Icons.star,
          color: material.Colors.deepOrange,
        ),
        Icon(
          material.Icons.star,
          color: material.Colors.deepOrange,
        ),
        Icon(
          material.Icons.star,
          color: material.Colors.deepOrange,
        ),
        Icon(
          material.Icons.star_border,
          color: material.Colors.deepOrange,
        ),
        Icon(
          material.Icons.star_border,
          color: material.Colors.deepOrange,
        )
      ],
    );
  }
}
