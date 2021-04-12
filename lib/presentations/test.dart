import 'package:flutter/material.dart';
import 'package:poem_and_strings/models/models.dart';

class Test extends StatelessWidget {
  final Player player = Player();

  Widget setEasyStageButton() {
    return ElevatedButton.icon(
        onPressed: () {
          player.setEasyStageProgress(1, 3);
        },
        icon: Icon(Icons.ondemand_video),
        label: Text('Set Stage'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
          child: Column(
        children: <Widget>[
          setEasyStageButton(),
        ],
      )),
    ));
  }
}
