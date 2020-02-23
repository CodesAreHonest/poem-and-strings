import 'package:flutter/material.dart';

class DifficultStageSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("困难", style: TextStyle(color: Colors.white)),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Colors.red[800],
                Colors.red[700],
                Colors.red[600],
                Colors.red[500],
              ]
            )
          )
        ),
        actions: <Widget>[
          Container(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 18.0),
                child: Text(
                    "1/10",
                    style: TextStyle(
                        color: Colors.white,
                      fontSize: 16.0
                    )
                )
            )
          )
        ],
      ),
    );
  }
}
