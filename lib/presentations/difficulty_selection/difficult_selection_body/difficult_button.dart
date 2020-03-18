import 'package:flutter/material.dart';

class DifficultButton extends StatelessWidget {
  Future navigateToSubPage(context) async {
    Navigator.pushNamed(context, '/DifficultStageSelection');
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        onPressed: () {
          navigateToSubPage(context);
        },
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        textColor: Colors.white,
        padding: EdgeInsets.all(0.0),
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      Colors.red[800],
                      Colors.red[700],
                      Colors.red[600],
                      Colors.red[500],
                    ])),
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("困难", style: TextStyle(fontSize: 32)),
                  SizedBox(height: 8.0),
//                  Text("0/10", style: TextStyle(fontSize: 16, color: Colors.white70))
                ])));
  }
}
