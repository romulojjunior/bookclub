import 'package:bookclub/ui/utils/os_selector.dart';
import 'package:flutter/cupertino.dart' as ios;
import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';

class UILoadingIndicator extends StatelessWidget {
  const UILoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: OSSelector(
        android: material.CircularProgressIndicator(),
        iOS: ios.CupertinoActivityIndicator(),
      ),
    );
  }
}
