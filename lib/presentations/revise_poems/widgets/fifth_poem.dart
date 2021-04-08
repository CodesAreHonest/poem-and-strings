import 'package:flutter/material.dart';
import 'package:poem_and_strings/models/easy_stage/easy_stage_five.dart';
import 'package:poem_and_strings/presentations/revise_poems/utilities/styles.dart';

@immutable
class FifthPoem extends StatelessWidget {
  Widget completeMissionContainer(BuildContext context) => ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white70),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          ),
          padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(horizontal: 120.0, vertical: 16.0),
          )),
      onPressed: () {
        Navigator.pushNamedAndRemoveUntil(
            context, '/RevisionSuccess', (e) => false);
      },
      child: Text('结束',
          style: TextStyle(
              color: Colors.blue[800],
              fontSize: 16,
              fontWeight: FontWeight.bold)));

  final EasyStageFive stageFive = EasyStageFive();

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
