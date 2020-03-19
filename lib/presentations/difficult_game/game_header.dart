import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:poem_and_strings/models/player.dart';

class GameHeader extends StatefulWidget {
  final int step;
  final String stageCount;
  final Player player = Player();
  final bool enableDescription;

  GameHeader(
      {@required this.step,
      @required this.stageCount,
      @required this.enableDescription});

  @override
  _GameHeaderState createState() => _GameHeaderState();
}

class _GameHeaderState extends State<GameHeader> {
  int coin = 0;

  @override
  void initState() {
    getCurrentCoin();
    super.initState();
  }

  @override
  void didUpdateWidget(GameHeader oldWidget) {
    if (oldWidget.step != widget.step) {
      getCurrentCoin();
    }

    if (oldWidget.enableDescription != widget.enableDescription) {
      getCurrentCoin();
    }
    super.didUpdateWidget(oldWidget);
  }

  void getCurrentCoin() async {
    int coinBalance = await widget.player.getCoinBalance();
    setState(() {
      coin = coinBalance;
    });
  }

  @override
  Widget build(BuildContext context) {
    int step = widget.step;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: <Color>[
        Colors.lightBlueAccent[100],
        Colors.lightBlueAccent[200],
        Colors.blue[300],
        Colors.lightBlueAccent[400],
      ])),
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(widget.stageCount,
              style: TextStyle(
                  color: Colors.blue[800],
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0)),
          Text("$step/10 步",
              style: TextStyle(
                  color: Colors.blue[800],
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                  letterSpacing: 1.0)),
          Text("金币: $coin",
              style: TextStyle(
                  color: Colors.yellowAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0)),
        ],
      ),
    );
  }
}
