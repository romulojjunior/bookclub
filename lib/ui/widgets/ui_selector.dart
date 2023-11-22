import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class UISelector extends StatelessWidget {
  const UISelector({super.key, this.android, this.iOS, this.macOS, this.generic});

  final Widget? android;
  final Widget? iOS;
  final Widget? macOS;
  final Widget? generic;

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) return android ?? generic ?? const Placeholder();

    if (Platform.isAndroid) return android ?? const Placeholder();
    if (Platform.isIOS) return iOS ?? const Placeholder();
    if (Platform.isMacOS) return macOS ?? iOS ?? const Placeholder();

    return generic ?? const Placeholder();
  }
}
