import 'package:poem_and_strings/models/models.dart';

int stageCountSelector(List<Character> data) => data.length;

int characterPositionSelector(List<Character> data, character) =>
    data.indexOf(character);

bool isStageCompletedSelector(List<Character> stageData) {
  List<Character> containIncompleted =
      stageData.where((item) => item.completed == false).toList();

  return stageData.length != 0 && containIncompleted.length == 0;
}

bool isStageIncompletedSelector(int stepPerformed, int maximumSteps) =>
    stepPerformed >= maximumSteps;

int ratingSelector(int stepRemaining) {
  if (stepRemaining <= 2) {
    return 1;
  }

  if (stepRemaining <= 4) {
    return 2;
  }

  if (stepRemaining <= 6) {
    return 3;
  }

  return 3;
}
