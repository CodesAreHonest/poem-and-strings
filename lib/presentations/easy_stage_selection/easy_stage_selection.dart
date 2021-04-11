import "package:flutter/material.dart";
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
import 'widgets/appbar.dart';
import 'widgets/easy_stage.dart';

class EasyStageSelection extends StatefulWidget {
  final Function pauseMusic;
  final Function resumeMusic;

  EasyStageSelection({@required this.resumeMusic, @required this.pauseMusic});

  @override
  _EasyStageSelectionState createState() => _EasyStageSelectionState();
}

class _EasyStageSelectionState extends State<EasyStageSelection> {
  @override
  void initState() {
    widget.resumeMusic();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EasyStageAppBar(),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
              Colors.green.shade300,
              Colors.green.shade400,
            ])),
        child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ListView(
              children: <Widget>[
                EasyStage(
                    key: ArcKeys.easyStageList('firstStage'),
                    stage: EasyStageOne(),
                    starRating: 1,
                    level: 1,
                    pauseMusic: widget.pauseMusic),
                EasyStage(
                    key: ArcKeys.easyStageList('secondStage'),
                    stage: EasyStageTwo(),
                    starRating: 1,
                    level: 2,
                    pauseMusic: widget.pauseMusic),
                EasyStage(
                    key: ArcKeys.easyStageList('thirdStage'),
                    stage: EasyStageThree(),
                    starRating: 1,
                    level: 3,
                    pauseMusic: widget.pauseMusic),
                EasyStage(
                    key: ArcKeys.easyStageList('fourStage'),
                    stage: EasyStageFour(),
                    starRating: 1,
                    level: 4,
                    pauseMusic: widget.pauseMusic),
                EasyStage(
                    key: ArcKeys.easyStageList('fiveStage'),
                    stage: EasyStageFive(),
                    starRating: 1,
                    level: 5,
                    pauseMusic: widget.pauseMusic),
                EasyStage(
                    key: ArcKeys.easyStageList('sixStage'),
                    stage: EasyStageSix(),
                    starRating: 1,
                    level: 6,
                    pauseMusic: widget.pauseMusic),
                EasyStage(
                    key: ArcKeys.easyStageList('sevenStage'),
                    stage: EasyStageSeven(),
                    starRating: 1,
                    level: 7,
                    pauseMusic: widget.pauseMusic),
                EasyStage(
                    key: ArcKeys.easyStageList('eightStage'),
                    stage: EasyStageEight(),
                    starRating: 1,
                    level: 8,
                    pauseMusic: widget.pauseMusic),
                EasyStage(
                    key: ArcKeys.easyStageList('nineStage'),
                    stage: EasyStageNine(),
                    starRating: 1,
                    level: 9,
                    pauseMusic: widget.pauseMusic),
                EasyStage(
                    key: ArcKeys.easyStageList('tenStage'),
                    stage: EasyStageTen(),
                    starRating: 1,
                    level: 10,
                    pauseMusic: widget.pauseMusic)
              ],
            )),
      ),
    );
  }
}
