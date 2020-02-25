import "package:flutter/material.dart";
import 'package:poem_and_strings/screens/difficult_stage/stage_one.dart';
import 'package:poem_and_strings/screens/difficult_stage_selection/index.dart';
import "screens/home/index.dart";
import "screens/difficulty_selection/index.dart";
import "screens/easy_stage_selection/index.dart";

class Routes {
  final routes = <String, WidgetBuilder>{
    '/Home': (BuildContext context) => Home(),
    '/DifficultySelection': (BuildContext context) => DifficultySelection(),
    '/DifficultStageSelection': (BuildContext context) => DifficultStageSelection(),
    '/DifficultStageOne': (BuildContext context) => DifficultStageOne(),
    '/EasyStageSelection': (BuildContext context) => EasyStageSelection(),
  };

  Routes() {
    runApp(MaterialApp(title: "诗词串串乐", routes: routes, home: DifficultStageOne()));
  }
}
