import 'package:bookclub/generated/l10n.dart';
import 'package:bookclub/ui/theme/images_path.dart';
import 'package:flutter/material.dart';

class UIErrorMessage extends StatelessWidget {
  final String? title;
  final String? message;
  final Function onRetry;

  const UIErrorMessage({this.title, this.message, required this.onRetry, super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(constraints: const BoxConstraints(maxWidth: 350), child: Image.asset(ImagesPath.connectionErroe)),
            Container(
                margin: const EdgeInsets.only(top: 16, bottom: 16),
                child: Text(
                  title ?? S.of(context).messageErrorTitle,
                  style: const TextStyle(fontSize: 32),
                  textAlign: TextAlign.center,
                )),
            Text(
              title ?? S.of(context).messageErrorBody,
              textAlign: TextAlign.center,
            ),
            Container(
                margin: const EdgeInsets.all(16),
                child: TextButton(onPressed: () => onRetry(), child: Text(S.of(context).retry))),
          ],
        ),
      ),
    );
  }
}
