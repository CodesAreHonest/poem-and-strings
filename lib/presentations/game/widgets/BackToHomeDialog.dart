import 'package:flutter/material.dart';

class BackToHomeDialog extends StatelessWidget {
  Widget leaveButton(BuildContext context) => TextButton(
        child: Text("回到主页", style: TextStyle(color: Colors.red)),
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(
              context, '/DifficultySelection', (e) => false);
        },
      );

  Widget cancelButton(BuildContext context) => TextButton(
        child: Text("再试一次", style: TextStyle(color: Colors.green)),
        onPressed: () {
          Navigator.of(context, rootNavigator: true).pop('dialog');
        },
      );

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("回到主页？"),
      content: Text("目前的进度将会被放弃"),
      actions: [
        cancelButton(context),
        leaveButton(context),
      ],
    );
  }
}
