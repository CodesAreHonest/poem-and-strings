import 'dart:convert';

import 'package:poem_and_strings/data/StageLevel.dart';

class EasyStageRecord {
  final Map<String, int> easyStage;

  EasyStageRecord({this.easyStage});

  void setEasyStageRecord(String stage, int rating) {
    this.easyStage[stage] = rating;
  }

  @override
  String toString() {
    return jsonEncode(this.easyStage);
  }

  factory EasyStageRecord.fromJson(String playerRecord) {
    return EasyStageRecord(easyStage: jsonDecode(playerRecord));
  }
}
