import 'package:poem_and_strings/models/character.dart';

class Stage {
  final int numOfRows = 2;

  int stepUsed = 0;
  int targetElementPosition;

  List<Character> stageData = [
    Character("爆", false, false, 0),
    Character("竹", false, false, 1),
    Character("声", false, false, 2),
    Character("中", false, false, 3),
    Character("一", false, false, 4),
    Character("岁", false, false, 5),
    Character("除", false, false, 6),
    Character("春", false, false, 7),
    Character("风", false, false, 8),
    Character("送", false, false, 9),
    Character("暖", false, false, 10),
    Character("入", false, false, 11),
    Character("屠", false, false, 12),
    Character("苏", false, false, 13)
  ];

  Stage();

  double getItemsPerRow() => stageData.length / this.numOfRows;

  int getTotalStageItems() => stageData.length;

  int getCharacterLocation(Character character) => stageData.indexOf(character);

  int getTargetElementPosition() => this.targetElementPosition;

  int getSteps() => this.stepUsed;

  int numberOfRowRendered() => this.numOfRows;

  void incrementStep() => ++this.stepUsed;

  List<Character> getRandomShuffledData() {
    stageData.shuffle();

    for (int i = 0; i < stageData.length; i++) {
      Character currentItem = stageData[i];
      bool isCompleted = this.isCompleted(currentItem);

      if (isCompleted) {
        currentItem.setCompleted(true);
        this.updateCharacter(currentItem);
      }
    }

    return stageData;
  }

  List<Character> getCurrentStageData() => this.stageData;

  void updateCharacter(Character character) {
    int characterPosition = this.getCharacterLocation(character);
    stageData.removeAt(characterPosition);
    stageData.insert(characterPosition, character);
  }

  void updateCharacterWithPosition(Character character, int position) {
    stageData.removeAt(position);
    stageData.insert(position, character);
  }

  void setTargetElementPosition(int targetElementPosition) {
    this.targetElementPosition = targetElementPosition;
  }

  void swapCharacter(Character firstItem, Character secondItem) {
    int firstItemLocation = this.getCharacterLocation(firstItem);
    int secondItemLocation = this.getCharacterLocation(secondItem);
    this.updateCharacterWithPosition(secondItem, firstItemLocation);
    this.updateCharacterWithPosition(firstItem, secondItemLocation);

    this.isCharacterCompleted(firstItem);
    this.isCharacterCompleted(secondItem);

    this.incrementStep();
  }

  void isCharacterCompleted(Character character) {
    bool isCharacterInCorrectPosition = this.isCompleted(character);
    character.setCompleted(isCharacterInCorrectPosition);
    this.updateCharacter(character);
  }

  bool isCompleted(Character character) {
    int currentLocation = this.getCharacterLocation(character);
    int dedicatedLocation = character.getLocation();

    return currentLocation == dedicatedLocation;
  }

  Character getCharacterAtPosition(int position) =>
      stageData.elementAt(position);
}
