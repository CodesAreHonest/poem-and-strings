import 'package:flutter/material.dart';
import 'package:poem_and_strings/core/ArcKeys.dart';
import 'package:poem_and_strings/models/difficult_stage/difficult_stage_five.dart';
import 'package:poem_and_strings/models/difficult_stage/difficult_stage_four.dart';
import 'package:poem_and_strings/models/difficult_stage/difficult_stage_one.dart';
import 'package:poem_and_strings/models/difficult_stage/difficult_stage_three.dart';
import 'package:poem_and_strings/models/difficult_stage/difficult_stage_two.dart';
import 'widgets/appbar.dart';
import 'widgets/difficult_stage.dart';

class DifficultStageSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DifficultStageAppBar(),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: ListView(
            children: <Widget>[
              DifficultStage(
                  key: ArcKeys.difficultStageList('firstStage'),
                  stage: DifficultStageOne(),
                  starRating: 1,
                  level: 1),
              DifficultStage(
                  key: ArcKeys.difficultStageList('secondStage'),
                  stage: DifficultStageTwo(),
                  starRating: 1,
                  level: 2),
              DifficultStage(
                  key: ArcKeys.difficultStageList('thirdStage'),
                  stage: DifficultStageThree(),
                  starRating: 1,
                  level: 3),
              DifficultStage(
                  key: ArcKeys.difficultStageList('fourStage'),
                  stage: DifficultStageFour(),
                  starRating: 1,
                  level: 4),
              DifficultStage(
                  key: ArcKeys.difficultStageList('fiveStage'),
                  stage: DifficultStageFive(),
                  starRating: 1,
                  level: 5),
            ],
          )),
    );
  }
}
