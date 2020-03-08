import 'package:poem_and_strings/actions/stage_actions.dart';
import 'package:poem_and_strings/models/character.dart';
import 'package:poem_and_strings/states/states.dart';
import "package:redux/redux.dart";

final stageReducer = combineReducers<StageState>([
  TypedReducer<StageState, GetStageDataAction>(_getStage),
  TypedReducer<StageState, UpdateCharacterAction>(_updateCharacter),
  TypedReducer<StageState, SwapCharacterAction>(_swapCharacter),
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

  return stageState.copyWith(
      data:
          action.swapCharacter(stageData, currentCharacter, previousCharacter));
}
