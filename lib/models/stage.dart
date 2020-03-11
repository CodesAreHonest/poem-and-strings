import 'package:poem_and_strings/models/character.dart';
import 'package:flutter/foundation.dart';

class Stage {
  final int numOfRows;
  final int maximumSteps;
  final String stageCount;
  final List<Character> stageData;
  final String translation;
  final String background;

  Stage(
      {@required this.numOfRows,
      @required this.stageData,
      @required this.stageCount,
      @required this.maximumSteps,
      @required this.translation,
      @required this.background});

  double getItemsPerRow() => stageData.length / this.numOfRows;

  int getTotalStageItems() => stageData.length;

  int getCharacterLocation(Character character) => stageData.indexOf(character);

  int numberOfRowRendered() => this.numOfRows;

  List<Character> getRandomShuffledData() {
    resetCompletedData();
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

  void resetCompletedData() {
    for (int i = 0; i < stageData.length; i++) {
      Character currentItem = stageData[i];
      currentItem.setCompleted(false);
      currentItem.setSelected(false);
    }
  }

  void updateCharacter(Character character) {
    int characterPosition = this.getCharacterLocation(character);
    stageData.removeAt(characterPosition);
    stageData.insert(characterPosition, character);
  }

  bool isCompleted(Character character) {
    int currentLocation = this.getCharacterLocation(character);
    int dedicatedLocation = character.getLocation();

    return currentLocation == dedicatedLocation;
  }
}
