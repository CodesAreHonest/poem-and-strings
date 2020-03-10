import "package:flutter/material.dart";
import 'package:flutter_redux/flutter_redux.dart';
import 'package:poem_and_strings/models/easy_stage/easy_stage_one.dart';
import 'package:poem_and_strings/presentations/easy_stage_selection/easy_stage_selection.dart';
import 'package:poem_and_strings/presentations/game/game.dart';
import 'package:poem_and_strings/presentations/home/home.dart';
import 'package:poem_and_strings/routes.dart';
import "package:redux/redux.dart";
import "package:poem_and_strings/models/models.dart";
import 'package:poem_and_strings/models/stage.dart';

class ReduxApp extends StatelessWidget {
  final Store<AppState> store;

  ReduxApp({this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
        store: store,
        child: MaterialApp(
            title: "诗词串串乐",
            routes: Routes().routes,
            home: EasyStageSelection()));
  }
}
