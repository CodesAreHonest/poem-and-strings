import "package:flutter/material.dart";
import 'package:poem_and_strings/data/DifficultStage/DifficultFirstStage.dart';
import 'widgets/game_body.dart';
import 'widgets/translation.dart';
import "widgets/header.dart";

class DifficultStageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
                child: Column(children: <Widget>[
      DifficultStageHeader(),
      DifficultStageTranslation(),
      DifficultGameBody(),
    ]))));
  }
}
