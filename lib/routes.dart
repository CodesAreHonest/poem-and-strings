import "package:flutter/material.dart";
import 'package:poem_and_strings/screens/difficult_stage_selection/index.dart';
import "screens/home/index.dart";
import "screens/difficulty_selection/index.dart";

class Routes {
  final routes = <String, WidgetBuilder> {
    '/Home': (BuildContext context) => Home(),
    '/DifficultySelection': (BuildContext context) => DifficultySelection(),
    '/DifficultStageSelection': (BuildContext context) => DifficultStageSelection()
  };

  Routes() {
    runApp(MaterialApp(
      debugShowCheckedModeBanner: true,
      debugShowMaterialGrid: false,
      title: "诗词串串乐",
      routes: routes,
      home: Home()
    ));
  }
}