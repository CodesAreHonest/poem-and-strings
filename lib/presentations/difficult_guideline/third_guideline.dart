import 'package:flutter/material.dart';
import 'package:poem_and_strings/containers/difficult_game_container.dart';
import 'package:poem_and_strings/models/difficult_stage/difficult_stage_one.dart';
import 'package:poem_and_strings/models/models.dart';

class ThirdGuideline extends StatelessWidget {
  final DifficultStageOne difficultStageOne = DifficultStageOne();

  @override
  Widget build(BuildContext context) {
    int numOfRows = difficultStageOne.numOfRows;
    List<Character> stageData = difficultStageOne.stageData;
    String stageCount = difficultStageOne.stageCount;
    int maximumSteps = difficultStageOne.maximumSteps;
    String translation = difficultStageOne.translation;
    String youtubeLink = difficultStageOne.youtubeLink;
    String originalText = difficultStageOne.originalText;

    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(16.0),
      child: Column(children: <Widget>[
        Text("技巧：\n你可以通过译方提示，从中找出与古诗的对应的译方，并以此推测拼诗句。（此操作将被扣金币）",
            style: TextStyle(
                color: Colors.black87, fontSize: 13.0, letterSpacing: 1.1)),
        SizedBox(height: 20),
        Image.asset('assets/guideline/fourth_step.jpeg', width: 225),
        SizedBox(height: 20),
        TextButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green[700]),
              padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(horizontal: 8.0))),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DifficultGameContainer(
                        stage: Stage(
                            numOfRows: numOfRows,
                            stageData: stageData,
                            stageCount: stageCount,
                            maximumSteps: maximumSteps,
                            translation: translation,
                            youtubeLink: youtubeLink,
                            originalText: originalText))));
          },
          child: Text(
            '开始游戏!',
            style: TextStyle(color: Colors.white, fontSize: 16.0),
          ),
        )
      ]),
    );
  }
}
