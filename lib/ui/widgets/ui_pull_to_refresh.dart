import 'package:bookclub/ui/utils/os_selector.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';

class UIPullToRefresh extends StatelessWidget {
  final Function onRefresh;
  final Widget child;
  const UIPullToRefresh({required this.onRefresh, required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return OSSelector(
        android: material.RefreshIndicator(
          onRefresh: () {
            return Future(() => onRefresh());
          },
          // iOS Pull to Refresh will be implemented in the future.
          child: child,
        ),
        iOS: child);
  }
}
