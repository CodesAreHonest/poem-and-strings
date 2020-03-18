import "package:flutter/material.dart";
import 'package:poem_and_strings/data/ArcKeys.dart';
import 'package:poem_and_strings/models/easy_stage/easy_stage_one.dart';
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
      backgroundColor: Colors.grey[200],
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
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
                  pauseMusic: widget.pauseMusic)
            ],
          )),
    );
  }
}
