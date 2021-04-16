import 'package:flutter/material.dart';
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
import 'widgets/appbar.dart';
import 'widgets/difficult_stage.dart';

class DifficultStageSelection extends StatefulWidget {
  final Function pauseMusic;
  final Function resumeMusic;

  DifficultStageSelection(
      {required this.pauseMusic, required this.resumeMusic});

  @override
  _DifficultStageSelectionState createState() =>
      _DifficultStageSelectionState();
}

class _DifficultStageSelectionState extends State<DifficultStageSelection> {
  @override
  void initState() {
    widget.resumeMusic();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DifficultStageAppBar(),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
              Colors.red.shade100,
              Colors.red.shade200,
            ])),
        child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ListView(
              children: <Widget>[
                DifficultStage(
                    key: ArcKeys.difficultStageList('firstStage'),
                    stage: DifficultStageOne(),
                    starRating: 1,
                    level: 1,
                    pauseMusic: widget.pauseMusic),
                DifficultStage(
                    key: ArcKeys.difficultStageList('secondStage'),
                    stage: DifficultStageTwo(),
                    starRating: 1,
                    level: 2,
                    pauseMusic: widget.pauseMusic),
                DifficultStage(
                    key: ArcKeys.difficultStageList('thirdStage'),
                    stage: DifficultStageThree(),
                    starRating: 1,
                    level: 3,
                    pauseMusic: widget.pauseMusic),
                DifficultStage(
                    key: ArcKeys.difficultStageList('fourStage'),
                    stage: DifficultStageFour(),
                    starRating: 1,
                    level: 4,
                    pauseMusic: widget.pauseMusic),
                DifficultStage(
                    key: ArcKeys.difficultStageList('fiveStage'),
                    stage: DifficultStageFive(),
                    starRating: 1,
                    level: 5,
                    pauseMusic: widget.pauseMusic),
                DifficultStage(
                    key: ArcKeys.difficultStageList('sixStage'),
                    stage: DifficultStageSix(),
                    starRating: 1,
                    level: 6,
                    pauseMusic: widget.pauseMusic),
                DifficultStage(
                    key: ArcKeys.difficultStageList('sevenStage'),
                    stage: DifficultStageSeven(),
                    starRating: 1,
                    level: 7,
                    pauseMusic: widget.pauseMusic),
                DifficultStage(
                    key: ArcKeys.difficultStageList('eightStage'),
                    stage: DifficultStageEight(),
                    starRating: 1,
                    level: 8,
                    pauseMusic: widget.pauseMusic),
                DifficultStage(
                    key: ArcKeys.difficultStageList('nineStage'),
                    stage: DifficultStageNine(),
                    starRating: 1,
                    level: 9,
                    pauseMusic: widget.pauseMusic),
                DifficultStage(
                    key: ArcKeys.difficultStageList('tenStage'),
                    stage: DifficultStageTen(),
                    starRating: 1,
                    level: 10,
                    pauseMusic: widget.pauseMusic),
              ],
            )),
      ),
    );
  }
}
