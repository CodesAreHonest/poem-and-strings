import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class GameHeader extends StatelessWidget {
  final int step;

  GameHeader({@required this.step});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.blue[100]),
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('第二关'),
          Text("$step/10 步"),
          Text('Coin: 57'),
        ],
      ),
    );
  }
}
