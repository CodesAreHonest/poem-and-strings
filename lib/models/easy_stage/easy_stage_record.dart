import 'dart:convert';

class EasyStageRecord {
  final Map<int, Map<String, int>> record;

  EasyStageRecord({required this.record});

  void setEasyStageRecord(int stage, Map<String, int> playerStageRecord) {
    this.record[stage] = playerStageRecord;
  }

  @override
  String toString() {
    return jsonEncode(this.record);
  }
}
