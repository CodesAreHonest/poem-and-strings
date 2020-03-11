import 'package:poem_and_strings/actions/stage_actions.dart';
import 'package:poem_and_strings/models/character.dart';
import 'package:poem_and_strings/states/states.dart';
import "package:redux/redux.dart";

final stageReducer = combineReducers<StageState>([
  TypedReducer<StageState, GetStageDataAction>(_getStage),
  TypedReducer<StageState, UpdateCharacterAction>(_updateCharacter),
  TypedReducer<StageState, SwapCharacterAction>(_swapCharacter),
  TypedReducer<StageState, ResetStageDataAction>(_resetCharacter),
]);

StageState _getStage(StageState stageState, GetStageDataAction action) {
  return stageState.copyWith(
      data: action.getStageData(),
      itemPerRow: action.getItemsPerRow(),
      numOfRow: action.getNumberOfRow());
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

StageState _resetCharacter(StageState stageState, ResetStageDataAction action) {
  return stageState.copyWith(
      data: action.getStageData(),
      itemPerRow: action.getItemsPerRow(),
      numOfRow: action.getNumberOfRow(),
      step: 0);
}
