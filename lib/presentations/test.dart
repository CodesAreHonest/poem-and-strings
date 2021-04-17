import 'package:flutter/material.dart';
import 'package:poem_and_strings/models/models.dart';

class Test extends StatelessWidget {
  final Player player = Player();

  Widget setEasyStageButton() {
    return ElevatedButton.icon(
        onPressed: () {
          player.setEasyStageProgress(1, 4);
        },
        icon: Icon(Icons.ondemand_video),
        label: Text('Set Easy Stage'));
  }

  Widget getEasyStageButton() {
    return ElevatedButton.icon(
        onPressed: () async {
          StageRecords? easyStage = await player.getEasyStageProgress();
          print(easyStage?.collection);
        },
        icon: Icon(Icons.ondemand_video),
        label: Text('Get Easy Stage'));
  }

  Widget setHardStageButton() {
    return ElevatedButton.icon(
        style:
            ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),
        onPressed: () {
          player.setHardStageProgress(2, 4);
        },
        icon: Icon(Icons.ondemand_video),
        label: Text('Set Hard Stage'));
  }

  Widget getHardStageButton() {
    return ElevatedButton.icon(
        style:
            ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),
        onPressed: () async {
          StageRecords? hardStage = await player.getHardStageProgress();
          print(hardStage?.collection);
        },
        icon: Icon(Icons.ondemand_video),
        label: Text('Get Hard Stage'));
  }

  Widget clearAllStates() {
    return ElevatedButton.icon(
        onPressed: () async {
          player.clearStorage();
        },
        icon: Icon(Icons.ondemand_video),
        label: Text('Clear Stage'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
          padding: EdgeInsets.only(top: 8.0),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              setEasyStageButton(),
              getEasyStageButton(),
              clearAllStates(),
              setHardStageButton(),
              getHardStageButton()
            ],
          )),
    ));
  }
}
