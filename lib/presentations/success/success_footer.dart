import 'package:flutter/material.dart';
import 'package:poem_and_strings/models/difficult_stage/difficult_stage_ten.dart';
import 'package:poem_and_strings/models/easy_stage/easy_stage_ten.dart';

class SuccessFooter extends StatelessWidget {
  final String stageCount;

  const SuccessFooter({Key key, @required this.stageCount}) : super(key: key);

  void conditionalNavigation(BuildContext context) {
    String routes = '/DifficultySelection';
    if (stageCount == DifficultStageTen().stageCount ||
        stageCount == EasyStageTen().stageCount) {
      routes = '/Congratulations';
    }

    Navigator.pushNamedAndRemoveUntil(context, routes, (e) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: ElevatedButton.icon(
            onPressed: () {
              this.conditionalNavigation(context);
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green[500])),
            icon: Icon(Icons.thumb_up, size: 12, color: Colors.white),
            label: Text('完成', style: TextStyle(color: Colors.white))),
      ),
    );
  }
}
