import "package:flutter/material.dart";
import 'package:poem_and_strings/models/easy_stage/easy_stage_one.dart';
import 'package:poem_and_strings/models/models.dart';
import 'package:poem_and_strings/containers/easy_game_container.dart';

class EasyStage extends StatelessWidget {
  EasyStage(
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
    String youtubeLink = stage.youtubeLink;
    String originalText = stage.originalText;

    return Column(
      children: <Widget>[
        Card(
          elevation: 7.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green[400],
              child: Text("$level",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
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
//            subtitle: StageRating(value: this.starRating),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              this.pauseMusic();
              if (stage is EasyStageOne) {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/EasyGuideline', (e) => false);
                return;
              }

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EasyGameContainer(
                          stage: Stage(
                              numOfRows: numOfRows,
                              stageData: stageData,
                              stageCount: stageCount,
                              maximumSteps: maximumSteps,
                              translation: translation,
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
