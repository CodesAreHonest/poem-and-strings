import 'package:flutter/material.dart';
import 'package:poem_and_strings/data/ArcKeys.dart';
import 'package:poem_and_strings/models/difficult_stage/difficult_stage_five.dart';
import 'package:poem_and_strings/models/difficult_stage/difficult_stage_four.dart';
import 'package:poem_and_strings/models/difficult_stage/difficult_stage_one.dart';
import 'package:poem_and_strings/models/difficult_stage/difficult_stage_three.dart';
import 'package:poem_and_strings/models/difficult_stage/difficult_stage_two.dart';
import 'widgets/appbar.dart';
import 'widgets/difficult_stage.dart';

class DifficultStageSelection extends StatefulWidget {
  final Function pauseMusic;
  final Function resumeMusic;

  DifficultStageSelection(
      {@required this.pauseMusic, @required this.resumeMusic});

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
            image: DecorationImage(
                image: AssetImage(
                  'assets/background/old_fashion.jpeg',
                ),
                fit: BoxFit.cover)),
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
              ],
            )),
      ),
    );
  }
}
