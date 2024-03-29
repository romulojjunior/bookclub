import 'package:bookclub/domain/entities/book.dart';
import 'package:bookclub/generated/l10n.dart';
import 'package:bookclub/ui/widgets/ui_selector.dart';
import 'package:bookclub/ui/widgets/ui_icon_button.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/cupertino.dart' as cupertino;

class BookPanelInfo extends StatelessWidget {
  const BookPanelInfo({super.key, required this.book, required this.isFavorite, required this.onFavorite});

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
            constraints: const BoxConstraints(minHeight: 50, minWidth: 50),
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              const UIIconButton(
                icon: UISelector(
                  android: Icon(material.Icons.shop),
                  iOS: Icon(cupertino.CupertinoIcons.shopping_cart),
                ),
              ),
              Text(
                S.of(context).buy,
                style: const TextStyle(fontSize: 12),
              ),
            ]),
          ),
          Container(
            margin: const EdgeInsets.all(8),
            constraints: const BoxConstraints(minHeight: 50, minWidth: 50),
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              UIIconButton(
                  icon: const UISelector(
                    android: Icon(material.Icons.star_border),
                    iOS: Icon(cupertino.CupertinoIcons.star),
                  ),
                  secondaryIcon: const UISelector(
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
          Container(
            margin: const EdgeInsets.all(8),
            constraints: const BoxConstraints(minHeight: 50, minWidth: 50),
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              const UIIconButton(
                icon: UISelector(
                  android: Icon(material.Icons.book_online),
                  iOS: Icon(cupertino.CupertinoIcons.book),
                ),
              ),
              Text(
                S.of(context).ebook,
                style: const TextStyle(fontSize: 12),
              ),
            ]),
          ),
          Container(
            margin: const EdgeInsets.all(8),
            constraints: const BoxConstraints(minHeight: 50, minWidth: 50),
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Text(book.averageRating?.toString() ?? '0'),
              Text(
                S.of(context).nReviews(book.ratingsCount ?? 0),
                style: const TextStyle(fontSize: 12),
              ),
            ]),
          ),
          Container(
            margin: const EdgeInsets.all(8),
            constraints: const BoxConstraints(minHeight: 50, minWidth: 50),
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Text(book.pageQuantity.toString()),
              Text(
                S.of(context).pages,
                style: const TextStyle(fontSize: 12),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
