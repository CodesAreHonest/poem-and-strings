import 'package:poem_and_strings/models/character.dart';

class GetStageDataAction {
  final List<Character> stageData;

  GetStageDataAction(this.stageData);

  @override
  String toString() {
    return "GetStageDataAction{stageData: $stageData}";
  }
}
