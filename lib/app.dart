import "package:flutter/material.dart";
import 'package:flutter_redux/flutter_redux.dart';
import 'package:poem_and_strings/presentations/home/home.dart';
import 'package:poem_and_strings/routes.dart';
import "package:redux/redux.dart";
import "package:poem_and_strings/models/models.dart";

import "package:flutter/services.dart";
import 'package:assets_audio_player/assets_audio_player.dart';

class ReduxApp extends StatefulWidget {
  final Store<AppState> store;
  ReduxApp({this.store});

  @override
  _ReduxAppState createState() => _ReduxAppState();
}

class _ReduxAppState extends State<ReduxApp> {
  AssetsAudioPlayer _assetsAudioPlayer;

  @override
  void initState() {
    print('start');
    _assetsAudioPlayer = AssetsAudioPlayer();
    _assetsAudioPlayer.open('assets/musics/background_music.mp3');
    _assetsAudioPlayer.play();
    super.initState();
  }

  @override
  void dispose() {
    _assetsAudioPlayer.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return StoreProvider(
        store: widget.store,
        child: MaterialApp(title: "诗词串串乐", routes: Routes().routes, home: Home()));
  }
}
