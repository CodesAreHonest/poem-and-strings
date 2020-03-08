import 'package:poem_and_strings/models/models.dart';

class GetStageDataAction {
  final String stageType;
  List<Character> _stageData;

  GetStageDataAction(this.stageType);

  List<Character> getStageData() {
    switch (this.stageType) {
      case 'easyFirstStage':
        Stage stage = Stage();
        setStageData(stage.getRandomShuffledData());
        return this._stageData;
      default:
        return [];
    }
  }

  void setStageData(List<Character> stageData) {
    this._stageData = stageData;
  }

  @override
  String toString() {
    return "GetStageDataAction{stageType: $stageType}";
  }
}
