import "package:flutter/material.dart";
import 'package:poem_and_strings/models/easy_stage/easy_stage_one.dart';
import 'package:poem_and_strings/models/models.dart';
import 'package:poem_and_strings/presentations/game/game.dart';
import "package:poem_and_strings/widgets/stage_rating.dart";

class EasyStage extends StatelessWidget {
  const EasyStage({
    Key key,
    @required this.steps,
    @required this.title,
    @required this.author,
    @required this.starRating,
  }) : super(key: key);

  final int steps;
  final String title;
  final String author;
  final int starRating;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
          //
          elevation: 3.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green[400],
              child: Text("$steps",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w400)),
            ),
            title: Row(
              children: <Widget>[
                Text(this.title,
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                SizedBox(width: 8.0),
                Text(this.author,
                    style: TextStyle(
                        fontSize: 13.0, fontWeight: FontWeight.normal))
              ],
            ),
            subtitle: StageRating(value: this.starRating),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Game(
                          stage: Stage(
                              numOfRows: EasyStageOne().numOfRows,
                              stageData: EasyStageOne().stageData,
                              stageCount: EasyStageOne().stageCount,
                              maximumSteps: EasyStageOne().maximumSteps))));
            },
            contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
          ),
        ),
        SizedBox(height: 8.0)
      ],
    );
  }
}
