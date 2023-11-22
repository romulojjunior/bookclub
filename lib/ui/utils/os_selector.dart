import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class OSSelector extends StatefulWidget {
  const OSSelector({super.key, this.android, this.iOS, this.macOS, this.generic});

  final Widget? android;
  final Widget? iOS;
  final Widget? macOS;
  final Widget? generic;

  @override
  State<OSSelector> createState() => _OSSelectorState();
}

class _OSSelectorState extends State<OSSelector> {
  @override
  Widget build(BuildContext context) {
    if (kIsWeb) return widget.android ?? widget.generic ?? const Placeholder();

    if (Platform.isAndroid) return widget.android ?? const Placeholder();
    if (Platform.isIOS) return widget.iOS ?? const Placeholder();
    if (Platform.isMacOS) return widget.macOS ?? widget.iOS ?? const Placeholder();

    return widget.generic ?? const Placeholder();
  }
}
