import "package:flutter/material.dart";
import 'package:flutter/services.dart';

class LeaveGame extends StatelessWidget {

  final redGradient = <Color>[
    Colors.red[800],
    Colors.red[700],
    Colors.red[600],
    Colors.red[500],
  ];

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        onPressed: () {
          SystemNavigator.pop();
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        textColor: Colors.white,
        padding: const EdgeInsets.all(0.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            gradient: LinearGradient(
                colors: redGradient
            ),
          ),
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          child: Text(
              '退出游戏',
              style: TextStyle(fontSize: 24)
          ),
        )
    );
  }
}
