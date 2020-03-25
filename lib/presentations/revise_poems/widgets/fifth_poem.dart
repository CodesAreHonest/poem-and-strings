import 'package:flutter/material.dart';
import 'package:poem_and_strings/models/easy_stage/easy_stage_five.dart';
import 'package:poem_and_strings/presentations/revise_poems/utilities/styles.dart';

@immutable
class FifthPoem extends StatelessWidget {
  final EasyStageFive stageFive = EasyStageFive();

  Widget completeMissionContainer(BuildContext context) => RaisedButton(
      color: Colors.white70,
      onPressed: () {
        Navigator.pushNamedAndRemoveUntil(
            context, '/RevisionSuccess', (e) => false);
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      padding: EdgeInsets.symmetric(horizontal: 120.0, vertical: 16.0),
      child: Text('结束',
          style: TextStyle(
              color: Colors.blue[800],
              fontSize: 16,
              fontWeight: FontWeight.bold)));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TitleStyleContainer(title: "朗诵诗歌 5"),
          SizedBox(height: 16.0),
          PoemStyleContainer(poems: stageFive.originalText),
          SizedBox(height: 16.0),
          completeMissionContainer(context)
        ],
      ),
    );
  }
}
