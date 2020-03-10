import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class GameHeader extends StatelessWidget {
  final int step;
  final String stageCount;

  GameHeader({@required this.step, @required this.stageCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.blue[100]),
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(this.stageCount),
          Text("$step/10 步"),
          Text('Coin: 57'),
        ],
      ),
    );
  }
}
