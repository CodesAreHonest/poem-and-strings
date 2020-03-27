import "package:flutter/material.dart";
import 'package:poem_and_strings/models/models.dart';
import 'widgets/game_title.dart';
import 'widgets/poem_found.dart';
import 'widgets/app_buttons/index.dart';

class Home extends StatefulWidget {
  Player player = Player();

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int totalStageCompleted;

  @override
  void initState() {
    this.getTotalStageCompleted();
    super.initState();
  }

  void getTotalStageCompleted() async {
    int totalStageCompletedCount =
        await widget.player.getTotalCompletedStageCount();
    setState(() {
      totalStageCompleted = totalStageCompletedCount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/background/water_bg.jpg'),
                  fit: BoxFit.cover)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GameTitle(),
                  SizedBox(height: 50),
//              PoemFound(totalStageCompleted: totalStageCompleted),
                  AppButtons(),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
