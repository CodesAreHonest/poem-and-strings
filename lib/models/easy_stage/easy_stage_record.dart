import 'dart:convert';

import 'package:poem_and_strings/models/models.dart';

class EasyStageRecord {
  final Map<int, Map<String, int>> record;
  PlayerStageRecord playerStageRecord;

  EasyStageRecord({this.record});

  void setEasyStageRecord(int stage, Map<String, int> playerStageRecord) {
    this.record[stage] = playerStageRecord;
  }

  @override
  String toString() {
    return jsonEncode(this.record);
  }
}
