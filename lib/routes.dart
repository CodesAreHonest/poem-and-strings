import "package:flutter/material.dart";
import 'package:poem_and_strings/containers/game_container.dart';
import 'package:poem_and_strings/containers/easy_stage_selection_container.dart';
import 'package:poem_and_strings/presentations/difficult_stage_selection/index.dart';
import 'package:poem_and_strings/presentations/home/index.dart';
import 'package:poem_and_strings/presentations/difficulty_selection/index.dart';
import 'package:poem_and_strings/presentations/test.dart';

class Routes {
  final routes = <String, WidgetBuilder>{
    '/Home': (BuildContext context) => Home(),
    '/DifficultySelection': (BuildContext context) => DifficultySelection(),
    '/DifficultStageSelection': (BuildContext context) =>
        DifficultStageSelection(),
    '/Game': (BuildContext context) => GameContainer(),
    '/EasyStageSelection': (BuildContext context) =>
        EasyStageSelectionContainer(),
    '/Test': (BuildContext context) => Test()
  };
}
