import 'package:flutter/material.dart';
import 'package:poem_and_strings/models/difficult_stage/difficult_stage_ten.dart';
import 'package:poem_and_strings/models/easy_stage/easy_stage_ten.dart';

class SuccessFooter extends StatelessWidget {
  final String stageCount;
  final String difficulty;

  const SuccessFooter(
      {Key? key, required this.stageCount, required this.difficulty})
      : super(key: key);

  void conditionalNavigation(BuildContext context) {
    String routes = this.difficulty == 'hard'
        ? '/DifficultStageSelection'
        : '/EasyStageSelection';
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
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: ElevatedButton.icon(
              onPressed: () {
                this.conditionalNavigation(context);
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue[800])),
              icon: Icon(Icons.arrow_forward_rounded,
                  size: 18, color: Colors.white),
              label: Text('下一关',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold))),
        ),
      ),
    );
  }
}
