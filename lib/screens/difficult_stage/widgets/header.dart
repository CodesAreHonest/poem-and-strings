import "package:flutter/material.dart";
import "package:poem_and_strings/data/DifficultStage/DifficultStage.dart";

class DifficultStageHeader extends StatefulWidget {
  final DifficultStage stage;

  DifficultStageHeader(this.stage);

  @override
  _DifficultStageHeaderState createState() => _DifficultStageHeaderState(stage);
}

class _DifficultStageHeaderState extends State<DifficultStageHeader> {
  DifficultStage firstStage;
  _DifficultStageHeaderState(this.firstStage);

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
