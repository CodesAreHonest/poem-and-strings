import "package:flutter/material.dart";
import 'package:poem_and_strings/models/easy_stage/easy_stage_one.dart';
import 'package:poem_and_strings/models/easy_stage/easy_stage_two.dart';
import 'package:poem_and_strings/models/easy_stage/easy_stage_three.dart';
import 'package:poem_and_strings/models/easy_stage/easy_stage_four.dart';
import 'package:poem_and_strings/models/easy_stage/easy_stage_five.dart';
import 'widgets/appbar.dart';
import 'widgets/easy_stage.dart';

class EasyStageSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EasyStageAppBar(),
      backgroundColor: Colors.green[200],
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: ListView(
            children: <Widget>[
              EasyStage(stage: EasyStageOne(), starRating: 1, level: 1),
              EasyStage(stage: EasyStageTwo(), starRating: 1, level: 2),
              EasyStage(stage: EasyStageThree(), starRating: 1, level: 3),
              EasyStage(stage: EasyStageFour(), starRating: 1, level: 4),
              EasyStage(stage: EasyStageFive(), starRating: 1, level: 5)
            ],
          )),
    );
  }
}
