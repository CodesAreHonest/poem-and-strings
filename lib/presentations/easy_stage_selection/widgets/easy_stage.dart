import "package:flutter/material.dart";
import 'package:poem_and_strings/models/easy_stage/easy_stage_one.dart';
import 'package:poem_and_strings/models/models.dart';
import 'package:poem_and_strings/containers/easy_game_container.dart';
import 'package:poem_and_strings/widgets/stage_rating.dart';

class EasyStage extends StatelessWidget {
  final dynamic stage;
  final int level;
  final int? starRating;
  final Function pauseMusic;
  final bool unlock;

  EasyStage(
      {Key? key,
      required this.stage,
      this.starRating,
      required this.level,
      required this.pauseMusic,
      this.unlock = true})
      : super(key: key);

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

    Widget activeCard = Card(
      elevation: 7.0,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.green[400],
          child: Text("$level",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
        title: Row(
          children: <Widget>[
            Text(title,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
            SizedBox(width: 8.0),
            Text(author,
                style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.normal))
          ],
        ),
        subtitle: this.starRating != null
            ? StageRating(value: this.starRating ?? 0, size: 16)
            : null,
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
                      level: this.level,
                      stage: Stage(
                          numOfRows: numOfRows,
                          stageData: stageData,
                          stageCount: stageCount,
                          maximumSteps: maximumSteps,
                          translation: translation,
                          youtubeLink: youtubeLink,
                          originalText: originalText))));
        },
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      ),
    );

    Widget inactiveCard = Card(
      child: Container(
        color: Colors.grey[800],
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey[700],
            child: Icon(Icons.lock_rounded, color: Colors.grey[400]),
          ),
          title: Row(
            children: [
              Text("关卡 未解锁",
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[400]))
            ],
          ),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        ),
      ),
    );

    return Column(
      children: <Widget>[
        this.unlock ? activeCard : inactiveCard,
        SizedBox(height: 8.0)
      ],
    );
  }
}
