import "package:flutter/material.dart";
import 'choose_stage.dart';
import 'leave_game.dart';

class AppButtons extends StatefulWidget {
  @override
  _AppButtonsState createState() => _AppButtonsState();
}

class _AppButtonsState extends State<AppButtons> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 24.0),
      child: Column(
        children: <Widget>[ChooseStage(), SizedBox(height: 12.0), LeaveGame()],
      ),
    );
  }
}
