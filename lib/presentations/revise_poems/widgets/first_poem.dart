import 'package:flutter/material.dart';
import 'package:poem_and_strings/models/easy_stage/easy_stage_one.dart';
import 'package:poem_and_strings/presentations/revise_poems/utilities/styles.dart';

@immutable
class FirstPoem extends StatelessWidget {
  final EasyStageOne stageOne = EasyStageOne();

  final Widget guidanceText = Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: RichText(
          text: TextSpan(
              style: TextStyle(
                  fontSize: 18.0,
                  letterSpacing: 1.0,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600),
              children: <TextSpan>[
            TextSpan(text: '背诵古诗:\n'),
            TextSpan(
                text: '请录制自己背诵古诗的视频，并上传到面子书班群',
                style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.normal,
                    height: 1.6))
          ])));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TitleStyleContainer(title: "朗诵诗歌 1"),
          SizedBox(height: 16.0),
          PoemStyleContainer(poems: stageOne.originalText),
        ],
      ),
    );
  }
}
