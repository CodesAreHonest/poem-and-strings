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
        appBar: AppBar(
          centerTitle: true,
          title: Text("选择游戏进度"),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: <Color>[
              Colors.orange[700],
              Colors.orange[600],
              Colors.orange[500],
              Colors.orange[400]
            ])),
          ),
          elevation: 0,
        ),
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/background/second_bg.jpeg'),
                    fit: BoxFit.cover)),
            child: Column(
              children: <Widget>[
//                DifficultySelectionHeader(),
                DifficultySelectionBody(),
              ],
            ),
          ),
        ));
  }
}
