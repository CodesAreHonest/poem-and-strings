import 'package:poem_and_strings/models/models.dart';

int stageCountSelector(List<Character> data) => data.length;

int characterPositionSelector(List<Character> data, character) =>
    data.indexOf(character);

bool isStageCompletedSelector(List<Character> stageData) {
  List<Character> containIncompleted =
      stageData.where((item) => item.completed == false).toList();

  return containIncompleted.length == 0;
}
