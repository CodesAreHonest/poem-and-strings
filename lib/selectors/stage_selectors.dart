import 'package:poem_and_strings/models/models.dart';

int stageCountSelector(List<Character> data) => data.length;

int characterPositionSelector(List<Character> data, character) =>
    data.indexOf(character);

bool isStageCompletedSelector(List<Character> stageData) {
  List<Character> containIncompleted =
      stageData.where((item) => item.completed == false).toList();

  return containIncompleted.length == 0;
}

bool isStageIncompletedSelector(int stepPerformed, int maximumSteps) =>
    stepPerformed > maximumSteps;

int ratingSelector(int stepRemaining) {
  if (stepRemaining <= 4) {
    return 1;
  }

  if (stepRemaining <= 7) {
    return 2;
  }

  if (stepRemaining <= 10) {
    return 3;
  }

  return 3;
}
