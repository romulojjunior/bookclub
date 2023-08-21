import 'package:bookclub/ui/utils/os_selector.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/cupertino.dart' as cupertino;

class BookPanelInfo extends StatelessWidget {
  const BookPanelInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(8),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                OSSelector(
                  android: Icon(material.Icons.shop),
                  iOS: Icon(cupertino.CupertinoIcons.shopping_cart),
                ),
                Text(
                  'Buy',
                  style: TextStyle(fontSize: 12),
                ),
              ]),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(8),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                OSSelector(
                  android: Icon(material.Icons.book_online),
                  iOS: Icon(cupertino.CupertinoIcons.book),
                ),
                Text(
                  'E-Book',
                  style: TextStyle(fontSize: 12),
                ),
              ]),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(8),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(children: [
                Text('5.0'),
                Text(
                  '500 reviews',
                  style: TextStyle(fontSize: 12),
                ),
              ]),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(8),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Text('99'),
                Text(
                  'pages',
                  style: TextStyle(fontSize: 12),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
