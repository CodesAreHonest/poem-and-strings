import "package:flutter/material.dart";
import 'widgets/game_title.dart';
import 'widgets/poem_found.dart';
import 'widgets/app_buttons/index.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GameTitle(),
                PoemFound(),
                AppButtons(),
              ],
            ),
          ],
        ))
    );
  }
}
