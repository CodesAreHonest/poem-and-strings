import 'dart:math';

import 'package:flutter/material.dart';
import 'package:poem_and_strings/models/character.dart';
import 'package:flutter/foundation.dart';

class Stage {
  final int numOfRows;
  final int maximumSteps;
  final String stageCount;
  final List<Character> stageData;
  final String translation;
  final String background;
  final String youtubeLink;

  Stage(
      {Key key,
      @required this.numOfRows,
      @required this.stageData,
      @required this.stageCount,
      @required this.maximumSteps,
      @required this.translation,
      @required this.background,
      @required this.youtubeLink});

  double getItemsPerRow() => stageData.length / this.numOfRows;

  int getTotalStageItems() => stageData.length;

  int getCharacterLocation(Character character) => stageData.indexOf(character);

  int numberOfRowRendered() => this.numOfRows;

  List<Character> getRandomShuffledData() {
    resetCompletedData();
    stageData.shuffle();

    int completedCount = 0;

    for (int i = 0; i < stageData.length; i++) {
      Character currentItem = stageData[i];
      bool isCompleted = this.isCompleted(currentItem);

      if (isCompleted) {
        currentItem.setCompleted(true);
        this.updateCharacter(currentItem);
        completedCount++;
      }
    }

    /**
     * If the completed count is less than 6,
     *  1. randomly find an uncompleted element and swap with an uncompleted element.
     *  2. obtain the intended location of target element and perform swapping.
     *  3. perform the actions until 6 completed character are formed.
     */
    while (completedCount <= 6) {
      List<Character> _uncompletedCharacter = stageData
          .where((character) => character.getCompleted() == false)
          .toList();

      Random rand = new Random();

      int randomIndex = rand.nextInt(_uncompletedCharacter.length);
      Character randomElement = stageData.elementAt(randomIndex);

      this.swapCharacterToComplete(randomElement);

      List<Character> _completedCharacter = stageData
          .where((character) => character.getCompleted() == true)
          .toList();

      completedCount = _completedCharacter.length;
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

  List<Character> swapCharacterToComplete(Character currentCharacter) {
    int currentCharacterCompleteLocation = currentCharacter.getLocation();
    int currentCharacterLocation = this.getCharacterLocation(currentCharacter);

    Character targetCharacter =
        stageData.elementAt(currentCharacterCompleteLocation);

    this.updateCharacterWithPosition(
        currentCharacter, currentCharacterCompleteLocation);
    this.updateCharacterWithPosition(targetCharacter, currentCharacterLocation);

    this.isCharacterCompleted(currentCharacter);
    this.isCharacterCompleted(targetCharacter);

    return stageData;
  }

  void updateCharacterWithPosition(Character character, int position) {
    stageData.removeAt(position);
    stageData.insert(position, character);
  }

  void isCharacterCompleted(Character character) {
    bool isCharacterInCorrectPosition = this.isCompleted(character);
    character.setCompleted(isCharacterInCorrectPosition);
    this.updateCharacter(character);
  }
}
