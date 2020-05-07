import 'package:flutter/material.dart';
import 'package:poem_and_strings/data/StageLevel.dart';
import 'package:poem_and_strings/models/models.dart';

class Test extends StatelessWidget {
  final Player player = Player();

  Widget getEasyStageButton() {
    return RaisedButton.icon(
        onPressed: () async {
          Map<String, int> data = await player.getEasyStageProgress();
		  print (data); 
        },
        icon: Icon(Icons.ondemand_video),
        label: Text('Get Stage'));
  }

  Widget setEasyStageButton() {
    return RaisedButton.icon(
        onPressed: () {
          String firstLevel = EasyLevel.second.toString();
          player.setEasyStageProgress(firstLevel, 3);
        },
        icon: Icon(Icons.ondemand_video),
        label: Text('Set Stage'));
  }

  Widget removeEasyStageButton() {
    return RaisedButton.icon(
        onPressed: () {
          player.removeEasyStageProgress();
        },
        icon: Icon(Icons.ondemand_video),
        label: Text('Delete Stage'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
          child: Column(
        children: <Widget>[
          getEasyStageButton(),
          setEasyStageButton(),
          removeEasyStageButton(),
        ],
      )),
    ));
  }
}
