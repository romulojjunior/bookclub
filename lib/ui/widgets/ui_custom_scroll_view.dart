import 'package:bookclub/ui/widgets/ui_selector.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/widgets.dart';

class UICustomScrollView extends StatelessWidget {
  final Function onRefresh;
  final List<Widget> slivers;
  const UICustomScrollView({required this.onRefresh, required this.slivers, super.key});

  @override
  Widget build(BuildContext context) {
    return UISelector(
        android: material.RefreshIndicator(
          onRefresh: () {
            return Future(() => onRefresh());
          },
          child: CustomScrollView(
            slivers: slivers,
          ),
        ),
        iOS: CustomScrollView(
          slivers: [
            cupertino.CupertinoSliverRefreshControl(
              onRefresh: () {
                return Future(() => onRefresh());
              },
            ),
            ...slivers
          ],
        ));
  }
}
