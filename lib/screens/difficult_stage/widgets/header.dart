import "package:flutter/material.dart";
import 'package:poem_and_strings/data/EasyStage/EasyFirstStage.dart';

class DifficultStageHeader extends StatefulWidget {
  @override
  _DifficultStageHeaderState createState() => _DifficultStageHeaderState();
}

class _DifficultStageHeaderState extends State<DifficultStageHeader> {
  EasyFirstStage firstStage;

  _DifficultStageHeaderState() {
    this.firstStage = EasyFirstStage();
  }

  @override
  Widget build(BuildContext context) {
    int currentStep = firstStage.getSteps();

    return Container(
      decoration: BoxDecoration(color: Colors.blue[100]),
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('第二关'),
          Text("$currentStep/10 步"),
          Text('Coin: 57'),
        ],
      ),
    );
  }
}
