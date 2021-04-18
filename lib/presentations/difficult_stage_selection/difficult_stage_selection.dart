import 'package:flutter/material.dart';
import 'package:poem_and_strings/models/difficult_stage/difficult_stage_constants.dart';
import 'package:poem_and_strings/models/player.dart';
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
  List<Widget> stageSelection = [];

  @override
  void initState() {
    widget.resumeMusic();
    initStageSelections();
    super.initState();
  }

  Future<void> initStageSelections() async {
    Player player = new Player();
    StageRecords? hardStageRecords = await player.getHardStageProgress();
    DifficultStageConstants hardStageConstants = new DifficultStageConstants();

    if (hardStageRecords == null) {
      List<Widget> stageSelectionWidget =
          hardStageConstants.content.map((stageConstant) {
        return DifficultStage(
          key: stageConstant.key,
          stage: stageConstant.stage,
          level: stageConstant.level,
          pauseMusic: widget.pauseMusic,
          unlock: stageConstant.level == 1,
        );
      }).toList();
      setState(() {
        stageSelection = stageSelectionWidget;
      });

      return;
    }

    List<Widget> stageSelectionWidget =
        hardStageConstants.content.map((stageConstant) {
      PlayerStageRecord? stageRecord =
          hardStageRecords.collection[stageConstant.level];

      if (stageRecord == null) {
        PlayerStageRecord? previousStageRecord =
            hardStageRecords.collection[stageConstant.level - 1];

        if (previousStageRecord == null) {
          return DifficultStage(
            key: stageConstant.key,
            stage: stageConstant.stage,
            level: stageConstant.level,
            pauseMusic: widget.pauseMusic,
            unlock: false,
          );
        }

        return DifficultStage(
            key: stageConstant.key,
            stage: stageConstant.stage,
            level: stageConstant.level,
            pauseMusic: widget.pauseMusic,
            unlock: true);
      }

      return DifficultStage(
          key: stageConstant.key,
          stage: stageConstant.stage,
          starRating: stageRecord.rating,
          level: stageConstant.level,
          pauseMusic: widget.pauseMusic,
          unlock: true);
    }).toList();

    setState(() {
      stageSelection = stageSelectionWidget;
    });
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
              children: stageSelection,
            )),
      ),
    );
  }
}
