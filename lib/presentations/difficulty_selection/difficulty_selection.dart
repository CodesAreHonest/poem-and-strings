import "package:flutter/material.dart";
import 'difficulty_selection_header.dart';
import 'difficult_selection_body/index.dart';

class DifficultySelection extends StatefulWidget {
  @override
  _DifficultySelectionState createState() => _DifficultySelectionState();
}

class _DifficultySelectionState extends State<DifficultySelection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              DifficultySelectionHeader(),
              DifficultySelectionBody(),
            ],
          ),
        )));
  }
}
