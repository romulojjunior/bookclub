import 'package:bookclub/domain/models/book.dart';
import 'package:bookclub/generated/l10n.dart';
import 'package:bookclub/ui/utils/os_selector.dart';
import 'package:bookclub/ui/widgets/ui_icon_button.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/cupertino.dart' as cupertino;

class BookPanelInfo extends StatelessWidget {
  const BookPanelInfo({required this.book, required this.isFavorite, required this.onFavorite, super.key});

  final Book book;
  final bool isFavorite;
  final Function(bool) onFavorite;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(8),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                const OSSelector(
                  android: Icon(material.Icons.shop),
                  iOS: Icon(cupertino.CupertinoIcons.shopping_cart),
                ),
                Text(
                  S.of(context).buy,
                  style: const TextStyle(fontSize: 12),
                ),
              ]),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(8),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                UIIconButton(
                    icon: const OSSelector(
                      android: Icon(material.Icons.star_border),
                      iOS: Icon(cupertino.CupertinoIcons.star),
                    ),
                    secondaryIcon: const OSSelector(
                      android: Icon(material.Icons.star),
                      iOS: Icon(cupertino.CupertinoIcons.star_fill),
                    ),
                    isSelected: isFavorite,
                    onPressed: onFavorite),
                Text(
                  S.of(context).favorite,
                  style: const TextStyle(fontSize: 12),
                ),
              ]),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(8),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                const OSSelector(
                  android: Icon(material.Icons.book_online),
                  iOS: Icon(cupertino.CupertinoIcons.book),
                ),
                Text(
                  S.of(context).ebook,
                  style: const TextStyle(fontSize: 12),
                ),
              ]),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(8),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                Text(book.averageRating?.toString() ?? '0'),
                Text(
                  S.of(context).nReviews(book.ratingsCount ?? 0),
                  style: const TextStyle(fontSize: 12),
                ),
              ]),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(8),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Text(book.pageQuantity.toString()),
                Text(
                  S.of(context).pages,
                  style: const TextStyle(fontSize: 12),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
