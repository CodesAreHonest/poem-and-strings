import "package:flutter/material.dart";
import 'package:poem_and_strings/models/easy_stage/easy_stage_one.dart';
import 'widgets/appbar.dart';
import 'widgets/easy_stage.dart';

class EasyStageSelection extends StatelessWidget {
  final titles = ['诗经 • 关唯', 'test', 'test', 'test', 'test'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EasyStageAppBar(),
      backgroundColor: Colors.green[200],
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: ListView(
            children: <Widget>[
              EasyStage(
                steps: 1,
                title: EasyStageOne().title,
                author: EasyStageOne().dynastyWithAuthor,
                starRating: 1,
              )
            ],
          )
//        child: ListView.builder(
//          itemCount: titles.length,
//          itemBuilder: (context, index) {
//            int steps = index + 1;
//
//            return EasyStage(steps: steps, titles: titles[index]);
//          },
//        ),
          ),
    );
  }
}
