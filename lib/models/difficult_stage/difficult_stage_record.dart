import 'dart:convert';

class DifficultStageRecord {
  final Map<String, int> difficultStage;

  DifficultStageRecord({required this.difficultStage});

  void setDifficultStageRecord(String stage, int rating) {
    this.difficultStage[stage] = rating;
  }

  @override
  String toString() {
    return jsonEncode(this.difficultStage);
  }

  factory DifficultStageRecord.fromJson(String playerRecord) {
    return DifficultStageRecord(difficultStage: jsonDecode(playerRecord));
  }
}
