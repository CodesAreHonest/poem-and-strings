import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:poem_and_strings/actions/music_actions.dart';
import 'package:poem_and_strings/presentations/revise_poems/index.dart';
import 'package:poem_and_strings/routes.dart';
import "package:poem_and_strings/models/models.dart";
import 'package:poem_and_strings/presentations/congratulation/index.dart';

class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  void didChangeDependencies() {
    StoreProvider.of<AppState>(context).dispatch(StartMusicActions());

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    StoreProvider.of<AppState>(context).dispatch(StopMusicActions());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "诗词串串乐", routes: Routes().routes, home: RevisePoems());
  }
}
