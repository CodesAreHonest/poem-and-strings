import "package:flutter/material.dart";
import 'package:poem_and_strings/containers/difficult_game_container.dart';
import 'package:poem_and_strings/containers/difficult_stage_selection_container.dart';
import 'package:poem_and_strings/containers/easy_game_container.dart';
import 'package:poem_and_strings/containers/easy_stage_selection_container.dart';
import 'package:poem_and_strings/presentations/home/index.dart';
import 'package:poem_and_strings/presentations/difficulty_selection/difficulty_selection.dart';
import 'package:poem_and_strings/presentations/revisions/stage_one.dart';
import 'package:poem_and_strings/presentations/test.dart';

class Routes {
  final routes = <String, WidgetBuilder>{
    '/Home': (BuildContext context) => Home(),
    '/DifficultySelection': (BuildContext context) => DifficultySelection(),
    '/DifficultStageSelection': (BuildContext context) =>
        DifficultStageSelectionContainer(),
    '/EasyGame': (BuildContext context) => EasyGameContainer(),
    '/DifficultGame': (BuildContext context) => DifficultGameContainer(),
    '/EasyStageSelection': (BuildContext context) =>
        EasyStageSelectionContainer(),
    '/Test': (BuildContext context) => Test(),
    '/StageOneRevision': (BuildContext context) => StageOneRevision()
  };
}
