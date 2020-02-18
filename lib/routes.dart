import "package:flutter/material.dart";
import "screens/home/index.dart";
import "screens/difficulty_selection/index.dart";

class Routes {
  final routes = <String, WidgetBuilder> {
    '/Home': (BuildContext context) => Home(),
    '/DifficultySelection': (BuildContext context) => DifficultySelection()
  };

  Routes() {
    runApp(MaterialApp(
      title: "诗词串串乐",
      routes: routes,
      home: Home()
    ));
  }
}