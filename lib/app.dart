import "package:flutter/material.dart";
import 'package:flutter_redux/flutter_redux.dart';
import 'package:poem_and_strings/presentations/home/home.dart';
import 'package:poem_and_strings/routes.dart';
import "package:redux/redux.dart";
import "package:poem_and_strings/models/models.dart";

import "package:flutter/services.dart";

class ReduxApp extends StatelessWidget {
  final Store<AppState> store;

  ReduxApp({this.store});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return StoreProvider(
        store: store, child: MaterialApp(title: "诗词串串乐", routes: Routes().routes, home: Home()));
  }
}
