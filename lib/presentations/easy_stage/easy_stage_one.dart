import "package:flutter/material.dart";
import 'package:poem_and_strings/containers/game_body_container.dart';

class EasyStageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
                child: Column(children: <Widget>[GameBodyContainer()]))));
  }
}
