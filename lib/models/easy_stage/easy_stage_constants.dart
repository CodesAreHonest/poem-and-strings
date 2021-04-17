import 'package:flutter/material.dart';
import 'package:poem_and_strings/data/ArcKeys.dart';
import 'package:poem_and_strings/models/easy_stage/easy_stage_eight.dart';
import 'package:poem_and_strings/models/easy_stage/easy_stage_nine.dart';
import 'package:poem_and_strings/models/easy_stage/easy_stage_one.dart';
import 'package:poem_and_strings/models/easy_stage/easy_stage_seven.dart';
import 'package:poem_and_strings/models/easy_stage/easy_stage_six.dart';
import 'package:poem_and_strings/models/easy_stage/easy_stage_ten.dart';
import 'package:poem_and_strings/models/easy_stage/easy_stage_two.dart';
import 'package:poem_and_strings/models/easy_stage/easy_stage_three.dart';
import 'package:poem_and_strings/models/easy_stage/easy_stage_four.dart';
import 'package:poem_and_strings/models/easy_stage/easy_stage_five.dart';

class StageConstant {
  final Key key;
  final dynamic stage;
  final int starRating;
  final int level;

  StageConstant(
      {required this.key,
      required this.stage,
      required this.starRating,
      required this.level});
}

class EasyStageConstants {
  final List<StageConstant> content = [
    StageConstant(
        key: ArcKeys.easyStageList('firstStage'),
        stage: EasyStageOne(),
        starRating: 1,
        level: 1),
    StageConstant(
        key: ArcKeys.easyStageList('secondStage'),
        stage: EasyStageTwo(),
        starRating: 1,
        level: 2),
    StageConstant(
      key: ArcKeys.easyStageList('thirdStage'),
      stage: EasyStageThree(),
      starRating: 1,
      level: 3,
    ),
    StageConstant(
      key: ArcKeys.easyStageList('fourStage'),
      stage: EasyStageFour(),
      starRating: 1,
      level: 4,
    ),
    StageConstant(
      key: ArcKeys.easyStageList('fiveStage'),
      stage: EasyStageFive(),
      starRating: 1,
      level: 5,
    ),
    StageConstant(
      key: ArcKeys.easyStageList('sixStage'),
      stage: EasyStageSix(),
      starRating: 1,
      level: 6,
    ),
    StageConstant(
      key: ArcKeys.easyStageList('sevenStage'),
      stage: EasyStageSeven(),
      starRating: 1,
      level: 7,
    ),
    StageConstant(
      key: ArcKeys.easyStageList('eightStage'),
      stage: EasyStageEight(),
      starRating: 1,
      level: 8,
    ),
    StageConstant(
      key: ArcKeys.easyStageList('nineStage'),
      stage: EasyStageNine(),
      starRating: 1,
      level: 9,
    ),
    StageConstant(
      key: ArcKeys.easyStageList('tenStage'),
      stage: EasyStageTen(),
      starRating: 1,
      level: 10,
    )
  ];
}
