import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';
import 'package:uikit/actions/ui_action_selector.dart';

class UIAlertDialog {
  final String title;
  final String message;
  final String confirmationButonLabel;
  final String cancelButonLabel;
  final Function onConfirmation;
  final Function? onCancel;

  const UIAlertDialog(
      {required this.title,
      required this.message,
      required this.confirmationButonLabel,
      required this.cancelButonLabel,
      required this.onConfirmation,
      required this.onCancel});

  showDialog(BuildContext context) {
    UIActionSelector(onAndroid: _showAndroidDialog, onIOS: _showIOSDialog).select(context);
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
              child: Text(cancelButonLabel),
              onPressed: () {
                onCancel?.call();
                Navigator.of(context).pop();
              },
            ),
            material.TextButton(
              child: Text(confirmationButonLabel),
              onPressed: () {
                onConfirmation();
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
              onConfirmation();
              Navigator.of(context).pop();
            },
            child: Text(confirmationButonLabel),
          ),
          cupertino.CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () {
              onCancel?.call();
              Navigator.of(context).pop();
            },
            child: Text(cancelButonLabel),
          ),
        ],
      ),
    );
  }
}
