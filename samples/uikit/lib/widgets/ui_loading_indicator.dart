import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';
import 'package:uikit/widgets/ui_selector.dart';

class UILoadingIndicator extends StatelessWidget {
  const UILoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: UISelector(
        android: material.CircularProgressIndicator(),
        iOS: cupertino.CupertinoActivityIndicator(),
      ),
    );
  }
}
