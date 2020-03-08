import "package:flutter/material.dart";

import 'widgets/easy_button.dart';
import 'widgets/difficult_button.dart';

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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Ink(
                      decoration: ShapeDecoration(
                        color: Colors.lightBlue,
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.arrow_back),
                        color: Colors.white,
                        onPressed: () {
                          Navigator.pushNamed(context, "/Home");
                        },
                      )
                  ),
                  SizedBox(width: 40.0),
                  Text('选择游戏难度', style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.2,
                    fontSize: 20
                  ))
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        EasyButton(),
                        DifficultButton(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      )
    );
  }
}
