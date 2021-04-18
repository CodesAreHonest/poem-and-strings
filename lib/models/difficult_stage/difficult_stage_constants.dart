import 'package:poem_and_strings/data/ArcKeys.dart';
import 'package:poem_and_strings/models/difficult_stage/difficult_stage_eight.dart';
import 'package:poem_and_strings/models/difficult_stage/difficult_stage_five.dart';
import 'package:poem_and_strings/models/difficult_stage/difficult_stage_four.dart';
import 'package:poem_and_strings/models/difficult_stage/difficult_stage_nine.dart';
import 'package:poem_and_strings/models/difficult_stage/difficult_stage_one.dart';
import 'package:poem_and_strings/models/difficult_stage/difficult_stage_seven.dart';
import 'package:poem_and_strings/models/difficult_stage/difficult_stage_six.dart';
import 'package:poem_and_strings/models/difficult_stage/difficult_stage_ten.dart';
import 'package:poem_and_strings/models/difficult_stage/difficult_stage_three.dart';
import 'package:poem_and_strings/models/difficult_stage/difficult_stage_two.dart';
import 'package:poem_and_strings/models/easy_stage/easy_stage_constants.dart';

class DifficultStageConstants {
  final List<StageConstant> content = [
    StageConstant(
        key: ArcKeys.difficultStageList('firstStage'),
        stage: DifficultStageOne(),
        starRating: 1,
        level: 1),
    StageConstant(
        key: ArcKeys.difficultStageList('secondStage'),
        stage: DifficultStageTwo(),
        starRating: 1,
        level: 2),
    StageConstant(
      key: ArcKeys.difficultStageList('thirdStage'),
      stage: DifficultStageThree(),
      starRating: 1,
      level: 3,
    ),
    StageConstant(
      key: ArcKeys.difficultStageList('fourStage'),
      stage: DifficultStageFour(),
      starRating: 1,
      level: 4,
    ),
    StageConstant(
      key: ArcKeys.difficultStageList('fiveStage'),
      stage: DifficultStageFive(),
      starRating: 1,
      level: 5,
    ),
    StageConstant(
      key: ArcKeys.difficultStageList('sixStage'),
      stage: DifficultStageSix(),
      starRating: 1,
      level: 6,
    ),
    StageConstant(
      key: ArcKeys.difficultStageList('sevenStage'),
      stage: DifficultStageSeven(),
      starRating: 1,
      level: 7,
    ),
    StageConstant(
      key: ArcKeys.difficultStageList('eightStage'),
      stage: DifficultStageEight(),
      starRating: 1,
      level: 8,
    ),
    StageConstant(
      key: ArcKeys.difficultStageList('nineStage'),
      stage: DifficultStageNine(),
      starRating: 1,
      level: 9,
    ),
    StageConstant(
      key: ArcKeys.difficultStageList('tenStage'),
      stage: DifficultStageTen(),
      starRating: 1,
      level: 10,
    )
  ];
}
