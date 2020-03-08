import "package:flutter/material.dart";
import 'package:poem_and_strings/presentations/easy_stage/easy_stage_one.dart';
import 'package:poem_and_strings/presentations/easy_stage_selection/index.dart';
import 'package:poem_and_strings/presentations/difficult_stage/stage_one.dart';
import 'package:poem_and_strings/presentations/difficult_stage_selection/index.dart';
import 'package:poem_and_strings/presentations/home/index.dart';
import 'package:poem_and_strings/presentations/difficulty_selection/index.dart';

class Routes {
  final routes = <String, WidgetBuilder>{
    '/Home': (BuildContext context) => Home(),
    '/DifficultySelection': (BuildContext context) => DifficultySelection(),
    '/DifficultStageSelection': (BuildContext context) =>
        DifficultStageSelection(),
    '/DifficultStageOne': (BuildContext context) => DifficultStageOne(),
    '/EasyStageOne': (BuildContext context) => EasyStageOne(),
    '/EasyStageSelection': (BuildContext context) => EasyStageSelection(),
  };
}
