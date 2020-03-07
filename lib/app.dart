import "package:flutter/material.dart";
import 'package:flutter_redux/flutter_redux.dart';
import 'package:poem_and_strings/routes.dart';
import 'package:poem_and_strings/screens/difficult_stage/stage_one.dart';
import "package:redux/redux.dart";
import "package:poem_and_strings/actions/actions.dart";
import "package:poem_and_strings/models/models.dart";

class ReduxApp extends StatelessWidget {
  final Store<AppState> store;

  const ReduxApp({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
        store: store,
        child: MaterialApp(
            title: "诗词串串乐",
            routes: Routes().routes,
            home: DifficultStageOne()));
  }
}
