import 'package:poem_and_strings/actions/stage_actions.dart';
import 'package:poem_and_strings/models/character.dart';
import 'package:poem_and_strings/states/stage_states.dart';
import "package:redux/redux.dart";

final stageReducer = combineReducers<StageState>([
  // easy
  TypedReducer<StageState, GetEasyStageDataAction>(_getEasyStage),
  TypedReducer<StageState, ResetEasyStageDataAction>(_resetEasyCharacter),
  TypedReducer<StageState, SwapEasyCharacterAction>(_swapEasyCharacter),

  // difficult
  TypedReducer<StageState, GetStageDataAction>(_getStage),
  TypedReducer<StageState, ResetStageDataAction>(_resetCharacter),
  TypedReducer<StageState, SwapCharacterAction>(_swapCharacter),

  // common
  TypedReducer<StageState, UpdateCharacterAction>(_updateCharacter),
  TypedReducer<StageState, ResetStageDataAction>(_resetCharacter),
  TypedReducer<StageState, ResetStageAction>(_resetStage),
  TypedReducer<StageState, EnableDescriptionAction>(_enableDescription),
]);

StageState _getStage(StageState stageState, GetStageDataAction action) {
  return stageState.copyWith(
      data: action.getStageData(),
      itemPerRow: action.getItemsPerRow(),
      numOfRow: action.getNumberOfRow(),
      step: 0,
      enableDescription: false);
}

StageState _updateCharacter(
    StageState stageState, UpdateCharacterAction action) {
  List<Character> stageData = stageState.data;
  Character character = action.character;
  return stageState.copyWith(
      data: action.updateCharacter(stageData, character));
}

StageState _swapCharacter(StageState stageState, SwapCharacterAction action) {
  List<Character> stageData = stageState.data;
  Character currentCharacter = action.currentCharacter;
  Character previousCharacter = action.previousCharacter;
  int incrementedStep = action.incrementStep(stageState.step);

  return stageState.copyWith(
      data:
          action.swapCharacter(stageData, currentCharacter, previousCharacter),
      step: incrementedStep);
}

StageState _swapEasyCharacter(
    StageState stageState, SwapEasyCharacterAction action) {
  List<Character> stageData = stageState.data;
  Character currentCharacter = action.currentCharacter;
  Character previousCharacter = action.previousCharacter;
  int incrementedStep = action.incrementStep(stageState.step);

  return stageState.copyWith(
      data:
          action.swapCharacter(stageData, currentCharacter, previousCharacter),
      step: incrementedStep);
}

StageState _resetCharacter(StageState stageState, ResetStageDataAction action) {
  return stageState.copyWith(
      data: action.getStageData(),
      itemPerRow: action.getItemsPerRow(),
      numOfRow: action.getNumberOfRow(),
      step: 0,
      enableDescription: false);
}

StageState _resetStage(StageState stageState, ResetStageAction action) {
  return stageState.reset();
}

StageState _resetEasyCharacter(
    StageState stageState, ResetEasyStageDataAction action) {
  return stageState.copyWith(
      data: action.getEasyStageData(),
      itemPerRow: action.getItemsPerRow(),
      numOfRow: action.getNumberOfRow(),
      step: 0,
      enableDescription: false);
}

StageState _enableDescription(
    StageState stageState, EnableDescriptionAction action) {
  return stageState.copyWith(enableDescription: true);
}

StageState _getEasyStage(StageState stageState, GetEasyStageDataAction action) {
  return stageState.copyWith(
      data: action.getEasyStageData(),
      itemPerRow: action.getItemsPerRow(),
      numOfRow: action.getNumberOfRow(),
      step: 0,
      enableDescription: false);
}
