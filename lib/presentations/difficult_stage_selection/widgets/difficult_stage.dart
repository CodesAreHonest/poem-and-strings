import "package:flutter/material.dart";
import 'package:poem_and_strings/models/models.dart';
import 'package:poem_and_strings/containers/game_container.dart';
import "package:poem_and_strings/widgets/stage_rating.dart";

class DifficultStage extends StatelessWidget {
  DifficultStage(
      {Key key,
      @required this.stage,
      @required this.starRating,
      @required this.level})
      : super(key: key);

  final dynamic stage;
  final int level;
  final int starRating;

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
            subtitle: StageRating(value: 1),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Game(
                          stage: Stage(
                              numOfRows: numOfRows,
                              stageData: stageData,
                              stageCount: stageCount,
                              maximumSteps: maximumSteps,
                              translation: translation,
                              background: background))));
            },
            contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
          ),
        ),
        SizedBox(height: 8.0)
      ],
    );
  }
}
