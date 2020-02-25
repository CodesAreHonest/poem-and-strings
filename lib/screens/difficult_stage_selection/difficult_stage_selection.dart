import 'package:flutter/material.dart';
import "widgets/appbar.dart";
import "widgets/difficult_stage.dart";

class DifficultStageSelection extends StatelessWidget {

  final titles = ['诗经 • 关唯', 'test', 'test', 'test',
    'test'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DifficultStageAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: ListView.builder(
          itemCount: titles.length,
          itemBuilder: (context, index) {

            int steps = index + 1;

            return DifficultStage(steps: steps, titles: titles[index]);
          },
        ),
      ),
    );
  }
}