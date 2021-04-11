import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:poem_and_strings/actions/music_actions.dart';
import 'package:poem_and_strings/presentations/home/home.dart';
import 'package:poem_and_strings/routes.dart';
import "package:poem_and_strings/models/models.dart";
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    this.loadEnvironment();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeDependencies() {
    StoreProvider.of<AppState>(context).dispatch(StartMusicActions());

    super.didChangeDependencies();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.inactive) {
      StoreProvider.of<AppState>(context).dispatch(PauseMusicActions());
      return;
    }

    if (state == AppLifecycleState.resumed) {
      StoreProvider.of<AppState>(context).dispatch(ResumeMusicAction());
      return;
    }
  }

  @override
  void dispose() {
    StoreProvider.of<AppState>(context).dispatch(StopMusicActions());
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void loadEnvironment() async {
    await DotEnv.load(fileName: '.env');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "诗词串串乐", routes: Routes().routes, home: Home());
  }
}
