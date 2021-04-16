import 'package:flutter/material.dart';
import 'package:poem_and_strings/models/models.dart';

class ShowTipsDialog extends StatelessWidget {
  final Player player = Player();
  final Function onEnableDescription;

  ShowTipsDialog({required this.onEnableDescription});

  Widget confirmButton(BuildContext context) => TextButton(
        child: Text("显示提示", style: TextStyle(color: Colors.green[700])),
        onPressed: () {
          player.decrementCoin(5);
          this.onEnableDescription();
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
      title: Text("显示提示？"),
      content: Text("需要花费 5 金币"),
      actions: [
        cancelButton(context),
        confirmButton(context),
      ],
    );
  }
}
