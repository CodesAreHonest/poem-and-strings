import "package:flutter/material.dart";
import 'package:poem_and_strings/models/easy_stage/easy_stage_constants.dart';

import 'package:poem_and_strings/models/player.dart';
import 'widgets/appbar.dart';
import 'widgets/easy_stage.dart';
import 'dart:convert';

class EasyStageSelection extends StatefulWidget {
  final Function pauseMusic;
  final Function resumeMusic;

  EasyStageSelection({required this.resumeMusic, required this.pauseMusic});

  @override
  _EasyStageSelectionState createState() => _EasyStageSelectionState();
}

class _EasyStageSelectionState extends State<EasyStageSelection> {
  List<Widget> stageSelection = [];

  @override
  void initState() {
    widget.resumeMusic();
    initStageSelections();
    super.initState();
  }

  Future<void> initStageSelections() async {
    Player player = new Player();
    StageRecords? easyStageRecords = await player.getEasyStageProgress();
    EasyStageConstants easyStageConstants = new EasyStageConstants();

    if (easyStageRecords == null) {
      List<Widget> stageSelectionWidget =
          easyStageConstants.content.map((stageConstant) {
        return EasyStage(
          key: stageConstant.key,
          stage: stageConstant.stage,
          starRating: stageConstant.starRating,
          level: stageConstant.level,
          pauseMusic: widget.pauseMusic,
        );
      }).toList();
      setState(() {
        stageSelection = stageSelectionWidget;
      });

      return;
    }

    List<Widget> stageSelectionWidget =
        easyStageConstants.content.map((stageConstant) {
      PlayerStageRecord? stageRecord =
          easyStageRecords.collection[stageConstant.level];

      if (stageRecord == null) {
        PlayerStageRecord? previousStageRecord =
            easyStageRecords.collection[stageConstant.level - 1];

        if (previousStageRecord == null) {
          return EasyStage(
            key: stageConstant.key,
            stage: stageConstant.stage,
            level: stageConstant.level,
            pauseMusic: widget.pauseMusic,
            unlock: false,
          );
        }

        return EasyStage(
            key: stageConstant.key,
            stage: stageConstant.stage,
            level: stageConstant.level,
            pauseMusic: widget.pauseMusic,
            unlock: true);
      }

      return EasyStage(
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
              children: stageSelection,
            ),
          )),
    );
  }
}
