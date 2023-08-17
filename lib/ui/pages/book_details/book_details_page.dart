import 'package:bookclub/ui/widgets/ui_scaffold.dart';
// import 'package:flutter/cupertino.dart' as cupertino;
// import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return const UIScaffold(
        title: 'Details',
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text('Details'),
              ],
            ),
          ),
        ));
  }
}
