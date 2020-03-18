import "package:flutter/material.dart";

class GameFooter extends StatelessWidget {
  final Function onRefreshStage;

  GameFooter({@required this.onRefreshStage});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RawMaterialButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/EasyStageSelection');
            },
            child: Icon(Icons.home, color: Colors.white, size: 32.0),
            shape: CircleBorder(),
            elevation: 2.0,
            fillColor: Colors.blue[400],
            padding: EdgeInsets.all(8.0)),
        RawMaterialButton(
            onPressed: () {
              onRefreshStage();
            },
            child: Icon(Icons.refresh, color: Colors.white, size: 32.0),
            shape: CircleBorder(),
            elevation: 2.0,
            fillColor: Colors.blue[400],
            padding: EdgeInsets.all(8.0)),
        RawMaterialButton(
            onPressed: () {},
            child: Icon(Icons.lightbulb_outline, color: Colors.white, size: 32.0),
            shape: CircleBorder(),
            elevation: 2.0,
            fillColor: Colors.blue[400],
            padding: EdgeInsets.all(8.0)),
      ],
    ));
  }
}
