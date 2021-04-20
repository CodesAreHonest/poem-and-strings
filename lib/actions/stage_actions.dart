import 'package:poem_and_strings/models/models.dart';

class GetStageDataAction {
  final dynamic stage;

  GetStageDataAction(this.stage);

  List<Character> getStageData() {
    return stage.getRandomShuffledData();
  }

  double getItemsPerRow() {
    return stage.getTotalStageItems() / stage.numberOfRowRendered();
  }

  int getNumberOfRow() => stage.numberOfRowRendered();

  @override
  String toString() {
    return "GetStageDataAction{stage: $stage}";
  }
}

class GetEasyStageDataAction {
  final dynamic stage;

  GetEasyStageDataAction(this.stage);

  List<Character> getEasyStageData() {
    return stage.getEasyRandomShuffledData();
  }

  double getItemsPerRow() {
    return stage.getTotalStageItems() / stage.numberOfRowRendered();
  }

  int getNumberOfRow() => stage.numberOfRowRendered();

  @override
  String toString() {
    return "GetEasyStageDataAction{stage: $stage}";
  }
}

class UpdateCharacterAction {
  final Character character;

  UpdateCharacterAction(this.character);

  List<Character> updateCharacter(
      List<Character> stageData, Character character) {
    int characterPosition = stageData.indexOf(character);
    stageData.removeAt(characterPosition);
    stageData.insert(characterPosition, character);

    return stageData;
  }

  @override
  String toString() {
    return "UpdateCharacterAction{character: $character}";
  }
}

class SwapCharacterAction {
  final Character previousCharacter;
  final Character currentCharacter;
  final List<Character> data;

  SwapCharacterAction(this.data, this.previousCharacter, this.currentCharacter);

  int getCharacterLocation(Character character) => data.indexOf(character);

  void updateCharacterWithPosition(Character character, int position) {
    data.removeAt(position);
    data.insert(position, character);
  }

  void isCharacterCompleted(Character character) {
    bool isCharacterInCorrectPosition = this.isCompleted(character);
    character.setCompleted(isCharacterInCorrectPosition);

    this.updateCharacter(character);
  }

  void updateCharacter(Character character) {
    int characterPosition = this.getCharacterLocation(character);
    data.removeAt(characterPosition);
    data.insert(characterPosition, character);
  }

  bool isCompleted(Character character) {
    int currentLocation = this.getCharacterLocation(character);
    int dedicatedLocation = character.getLocation();

    return currentLocation == dedicatedLocation;
  }

  List<Character> swapCharacter(List<Character> stageData,
      Character previousCharacter, Character currentCharacter) {
    int currentCharacterLocation = this.getCharacterLocation(currentCharacter);
    int previousCharacterLocation =
        this.getCharacterLocation(previousCharacter);
    this.updateCharacterWithPosition(
        currentCharacter, previousCharacterLocation);
    this.updateCharacterWithPosition(
        previousCharacter, currentCharacterLocation);

    this.isCharacterCompleted(previousCharacter);
    this.isCharacterCompleted(currentCharacter);

    return data;
  }

  int incrementStep(int step) => step + 1;

  @override
  String toString() {
    return "SwapCharacterAction{previousCharacter: $previousCharacter, currentCharacter: $currentCharacter, data: $data}";
  }
}

class ResetStageDataAction {
  final dynamic stage;

  ResetStageDataAction(this.stage);

  List<Character> getStageData() {
    return stage.getRandomShuffledData();
  }

  double getItemsPerRow() {
    return stage.getTotalStageItems() / stage.numberOfRowRendered();
  }

  int getNumberOfRow() => stage.numberOfRowRendered();

  @override
  String toString() {
    return "GetStageDataAction{stage: $stage}";
  }
}

class ResetStageAction {
  final dynamic stage;

  ResetStageAction(this.stage);

  @override
  String toString() {
    return "ResetStageAction{stage: $stage}";
  }
}

class ResetEasyStageDataAction {
  final dynamic stage;

  ResetEasyStageDataAction(this.stage);

  List<Character> getEasyStageData() {
    return stage.getEasyRandomShuffledData();
  }

  double getItemsPerRow() {
    return stage.getTotalStageItems() / stage.numberOfRowRendered();
  }

  int getNumberOfRow() => stage.numberOfRowRendered();

  @override
  String toString() {
    return "ResetEasyStageDataAction{stage: $stage}";
  }
}

class EnableDescriptionAction {
  EnableDescriptionAction();

  @override
  String toString() => "EnableDescriptionAction";
}

class SwapEasyCharacterAction {
  final Character previousCharacter;
  final Character currentCharacter;
  final List<Character> data;

  SwapEasyCharacterAction(
      this.data, this.previousCharacter, this.currentCharacter);

  int getCharacterLocation(Character character) => data.indexOf(character);

  void updateCharacterWithPosition(Character character, int position) {
    data.removeAt(position);
    data.insert(position, character);
  }

  void isCharacterCompleted(Character character) {
    bool isCharacterInCorrectPosition = this.isCompleted(character);
    character.setCompleted(isCharacterInCorrectPosition);
    this.updateCharacter(character);

    if (character.getSpecial() && isCharacterInCorrectPosition) {
      character.setSpecial(false);

      int firstRow = (data.length / 2 - 1).toInt();
      int secondRow = (data.length - 1).toInt();

      if (character.getLocation() <= firstRow) {
        for (int index = 0; index <= firstRow; index++) {
          Character targetCharacter = data[index];
          if (targetCharacter.completed == false) {
            this.swapCharacterToComplete(targetCharacter);
          }
        }
      }

      if (character.getLocation() <= secondRow) {
        for (int index = firstRow; index <= secondRow; index++) {
          Character targetCharacter = data[index];
          if (targetCharacter.completed == false) {
            this.swapCharacterToComplete(targetCharacter);
          }
        }
      }
    }
  }

  void updateCharacter(Character character) {
    int characterPosition = this.getCharacterLocation(character);
    data.removeAt(characterPosition);
    data.insert(characterPosition, character);
  }

  bool isCompleted(Character character) {
    int currentLocation = this.getCharacterLocation(character);
    int dedicatedLocation = character.getLocation();

    return currentLocation == dedicatedLocation;
  }

  List<Character> swapCharacter(List<Character> stageData,
      Character previousCharacter, Character currentCharacter) {
    int currentCharacterLocation = this.getCharacterLocation(currentCharacter);
    int previousCharacterLocation =
        this.getCharacterLocation(previousCharacter);
    this.updateCharacterWithPosition(
        currentCharacter, previousCharacterLocation);
    this.updateCharacterWithPosition(
        previousCharacter, currentCharacterLocation);

    this.isCharacterCompleted(previousCharacter);
    this.isCharacterCompleted(currentCharacter);

    return data;
  }

  List<Character> swapCharacterToComplete(Character currentCharacter) {
    int currentCharacterCompleteLocation = currentCharacter.getLocation();
    int currentCharacterLocation = this.getCharacterLocation(currentCharacter);

    Character targetCharacter =
        data.elementAt(currentCharacterCompleteLocation);

    this.updateCharacterWithPosition(
        currentCharacter, currentCharacterCompleteLocation);
    this.updateCharacterWithPosition(targetCharacter, currentCharacterLocation);

    currentCharacter.setCompleted(true);
    targetCharacter.setCompleted(true);

    return data;
  }

  int incrementStep(int step) => step + 1;

  @override
  String toString() {
    return "SwapCharacterAction{previousCharacter: $previousCharacter, currentCharacter: $currentCharacter, data: $data}";
  }
}
