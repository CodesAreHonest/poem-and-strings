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

  @override
  String toString() {
    return "SwapCharacterAction{previousCharacter: $previousCharacter, currentCharacter: $currentCharacter, data: $data}";
  }
}
