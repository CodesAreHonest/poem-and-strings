import "package:flutter/material.dart";
import 'package:flutter_redux/flutter_redux.dart';
import 'package:poem_and_strings/app.dart';
import "package:redux/redux.dart";
import "package:poem_and_strings/models/models.dart";

import "package:flutter/services.dart";

class ReduxStore extends StatelessWidget {
  final Store<AppState> store;

  ReduxStore({this.store});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return StoreProvider(store: this.store, child: Application());
  }
}
