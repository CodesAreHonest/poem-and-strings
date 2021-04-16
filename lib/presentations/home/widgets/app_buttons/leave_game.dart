import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:poem_and_strings/actions/music_actions.dart';
import 'package:poem_and_strings/models/models.dart';

class LeaveGame extends StatelessWidget {
  final redGradient = <Color>[
    Colors.red.shade800,
    Colors.red.shade700,
    Colors.red.shade600,
    Colors.red.shade500,
  ];

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          StoreProvider.of<AppState>(context).dispatch(StopMusicActions());
          SystemNavigator.pop();
        },
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0))),
            padding: MaterialStateProperty.all(EdgeInsets.zero),
            textStyle:
                MaterialStateProperty.all(TextStyle(color: Colors.white))),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            gradient: LinearGradient(colors: redGradient),
          ),
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          child: Text('退出游戏', style: TextStyle(fontSize: 24)),
        ));
  }
}
