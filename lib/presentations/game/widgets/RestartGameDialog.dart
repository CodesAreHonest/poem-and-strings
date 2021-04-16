import 'package:flutter/material.dart';

class RestartGameDialog extends StatelessWidget {
  final Function onRefreshStage;

  RestartGameDialog({required this.onRefreshStage});

  Widget confirmButton(BuildContext context) => TextButton(
        child: Text("重新游戏", style: TextStyle(color: Colors.blue)),
        onPressed: () {
          this.onRefreshStage();
          Navigator.of(context, rootNavigator: true).pop('dialog');
        },
      );

  Widget cancelButton(BuildContext context) => TextButton(
        child: Text("取消", style: TextStyle(color: Colors.grey)),
        onPressed: () {
          Navigator.of(context, rootNavigator: true).pop('dialog');
        },
      );

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("重新游戏？"),
      content: Text("目前的进度将会被放弃"),
      actions: [
        cancelButton(context),
        confirmButton(context),
      ],
    );
  }
}
