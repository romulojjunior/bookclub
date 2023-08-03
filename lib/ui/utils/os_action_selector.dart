import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class OSActionSelector {
  final Function(BuildContext context)? onAndroid;
  final Function(BuildContext context)? onIOS;
  final Function(BuildContext context)? onMacOS;
  final Function(BuildContext context)? onGeneric;

  const OSActionSelector({this.onAndroid, this.onIOS, this.onMacOS, this.onGeneric});

  select(BuildContext context) {
    if (kIsWeb) {
      onAndroid?.call(context);
      return;
    }

    if (Platform.isAndroid) {
      onAndroid?.call(context);
      return;
    }

    if (Platform.isIOS) {
      onIOS?.call(context);
      return;
    }

    if (Platform.isMacOS) {
      onMacOS?.call(context) ?? onIOS?.call(context);
      return;
    }

    onGeneric?.call(context);
  }
}
