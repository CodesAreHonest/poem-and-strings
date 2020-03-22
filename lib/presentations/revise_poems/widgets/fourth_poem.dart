import 'package:flutter/material.dart';
import 'package:poem_and_strings/models/easy_stage/easy_stage_four.dart';
import 'package:poem_and_strings/presentations/revise_poems/utilities/styles.dart';

class FourthPoem extends StatelessWidget {
  final EasyStageFour stageFour = EasyStageFour();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TitleStyleContainer(title: "朗诵诗歌 4"),
          SizedBox(height: 16.0),
          PoemStyleContainer(poems: stageFour.originalText),
        ],
      ),
    );
  }
}
