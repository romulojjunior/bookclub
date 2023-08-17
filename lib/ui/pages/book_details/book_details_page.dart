import 'package:bookclub/ui/widgets/ui_scaffold.dart';
// import 'package:flutter/cupertino.dart' as cupertino;
// import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';

class BookDetailsPage extends StatefulWidget {
  const BookDetailsPage({super.key});

  @override
  State<BookDetailsPage> createState() => _BookDetailsPageState();
}

class _BookDetailsPageState extends State<BookDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return const UIScaffold(
        title: 'Book Details',
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text('Book Details'),
              ],
            ),
          ),
        ));
  }
}
