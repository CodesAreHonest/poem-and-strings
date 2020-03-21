import 'package:flutter/material.dart';
import 'package:poem_and_strings/models/easy_stage/easy_stage_one.dart';

class StageOneRevision extends StatelessWidget {
  final EasyStageOne easyStageOne = EasyStageOne();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(easyStageOne.title)),
        body: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
            decoration: BoxDecoration(color: Colors.grey[200]),
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), color: Colors.white),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(easyStageOne.originalText,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: 8.0),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(easyStageOne.translation,
                        style: TextStyle(color: Colors.black54, fontSize: 16)),
                  ),
                ],
              ),
            )));
  }
}
