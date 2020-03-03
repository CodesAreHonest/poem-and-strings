import 'package:poem_and_strings/data/Character.dart';

import "./EasyStage.dart";

class EasyFirstStage extends EasyStage {
  final int numOfRows = 4;

  List<Character> stageData = [
    Character("爆", false, false, 0),
    Character("竹", false, false, 1),
    Character("声", false, false, 2),
    Character("中", false, false, 3),
    Character("一", false, false, 4),
    Character("声", false, false, 5),
    Character("爆", false, false, 6),
    Character("春", false, false, 7),
    Character("风", false, false, 8),
    Character("送", false, false, 9),
    Character("暖", false, false, 10),
    Character("入", false, false, 11),
    Character("屠", false, false, 12),
    Character("苏", false, false, 13),
    Character("千", false, false, 14),
    Character("门", false, false, 15),
    Character("万", false, false, 16),
    Character("户", false, false, 17),
    Character("曈", false, false, 18),
    Character("曈", false, false, 19),
    Character("日", false, false, 20),
    Character("总", false, false, 21),
    Character("把", false, false, 22),
    Character("新", false, false, 23),
    Character("桃", false, false, 24),
    Character("换", false, false, 25),
    Character("旧", false, false, 26),
    Character("符", false, false, 27)
  ];

  int targetElementPosition;

  EasyFirstStage();

  double getItemsPerRow() => stageData.length / this.numOfRows;

  int getTotalStageItems() => stageData.length;

  void setTargetElementPosition(int targetElementPosition) {
    this.targetElementPosition = targetElementPosition;
  }

  List<Character> getRandomShuffledData() {
    stageData.shuffle();
    return stageData;
  }

  List<Character> getCurrentStageData() => this.stageData;

  void swapCharacter(Character character) async {}
}
