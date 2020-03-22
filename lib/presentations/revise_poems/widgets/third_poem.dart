import 'package:flutter/material.dart';
import 'package:poem_and_strings/models/easy_stage/easy_stage_three.dart';
import 'package:poem_and_strings/presentations/revise_poems/utilities/styles.dart';

@immutable
class ThirdPoem extends StatelessWidget {
  final EasyStageThree stageThree = EasyStageThree();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TitleStyleContainer(title: "朗诵诗歌 3"),
          SizedBox(height: 16.0),
          PoemStyleContainer(poems: stageThree.originalText),
        ],
      ),
    );
  }
}
