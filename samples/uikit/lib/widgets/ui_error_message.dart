import 'package:flutter/material.dart';

class UIErrorMessage extends StatelessWidget {
  final String title;
  final String message;
  final String retryLabel;
  final String errorPlaceholdAsset;
  final Function onRetry;

  const UIErrorMessage(
      {required this.title,
      required this.message,
      required this.retryLabel,
      required this.errorPlaceholdAsset,
      required this.onRetry,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(constraints: const BoxConstraints(maxWidth: 350), child: Image.asset(errorPlaceholdAsset)),
            Container(
                margin: const EdgeInsets.only(top: 16, bottom: 16),
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 32),
                  textAlign: TextAlign.center,
                )),
            Text(
              message,
              textAlign: TextAlign.center,
            ),
            Container(
                margin: const EdgeInsets.all(16),
                child: TextButton(onPressed: () => onRetry(), child: Text(retryLabel))),
          ],
        ),
      ),
    );
  }
}
