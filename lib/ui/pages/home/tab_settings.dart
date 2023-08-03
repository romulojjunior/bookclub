import 'package:bookclub/ui/widgets/ui_page_header.dart';
import 'package:flutter/widgets.dart';

class TabSettings extends StatelessWidget {
  final String title;
  const TabSettings({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            UIPageHeader(title: title),
          ],
        ),
      ),
    );
  }
}
