import "package:flutter/material.dart";
import 'package:poem_and_strings/containers/difficult_game_container.dart';
import 'package:poem_and_strings/models/difficult_stage/difficult_stage_one.dart';
import 'package:poem_and_strings/models/models.dart';

class DifficultStage extends StatelessWidget {
  DifficultStage(
      {Key key,
      @required this.stage,
      @required this.starRating,
      @required this.level,
      @required this.pauseMusic})
      : super(key: key);

  final dynamic stage;
  final int level;
  final int starRating;
  final Function pauseMusic;

  @override
  Widget build(BuildContext context) {
    String title = stage.title;
    String author = stage.dynastyWithAuthor;
    int numOfRows = stage.numOfRows;
    List<Character> stageData = stage.stageData;
    String stageCount = stage.stageCount;
    int maximumSteps = stage.maximumSteps;
    String translation = stage.translation;
    String background = stage.background;
    String youtubeLink = stage.youtubeLink;
    String originalText = stage.originalText;

    return Column(
      children: <Widget>[
        Card(
          //
          elevation: 3.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.red[400],
              child: Text("$level",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w400)),
            ),
            title: Row(
              children: <Widget>[
                Text(title,
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                SizedBox(width: 8.0),
                Text(author,
                    style: TextStyle(
                        fontSize: 13.0, fontWeight: FontWeight.normal))
              ],
            ),
//            subtitle: StageRating(value: 1),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              this.pauseMusic();
              if (stage is DifficultStageOne) {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/DifficultGuideline', (e) => false);
                return;
              }
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
                              background: background,
                              youtubeLink: youtubeLink,
                              originalText: originalText))));
            },
            contentPadding:
                EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          ),
        ),
        SizedBox(height: 8.0)
      ],
    );
  }
}
