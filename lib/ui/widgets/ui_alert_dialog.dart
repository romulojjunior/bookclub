import 'package:bookclub/generated/l10n.dart';
import 'package:bookclub/ui/utils/os_action_selector.dart';
import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';

class UIAlertDialog {
  final String title;
  final String message;
  final Function onSuccess;
  final Function? onCancel;

  const UIAlertDialog({required this.title, required this.message, required this.onSuccess, required this.onCancel});

  showDialog(BuildContext context) {
    OSActionSelector(onAndroid: _showAndroidDialog, onIOS: _showIOSDialog).select(context);
  }

  _showAndroidDialog(BuildContext context) {
    material.showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return material.AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            material.TextButton(
              child: Text(S.of(context).no),
              onPressed: () {
                onCancel?.call();
                Navigator.of(context).pop();
              },
            ),
            material.TextButton(
              child: Text(S.of(context).yes),
              onPressed: () {
                onSuccess();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  _showIOSDialog(BuildContext context) {
    cupertino.showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => cupertino.CupertinoAlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          cupertino.CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              onSuccess();
              Navigator.of(context).pop();
            },
            child: Text(S.of(context).yes),
          ),
          cupertino.CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () {
              onCancel?.call();
              Navigator.of(context).pop();
            },
            child: Text(S.of(context).no),
          ),
        ],
      ),
    );
  }
}
