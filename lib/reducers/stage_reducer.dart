import 'package:poem_and_strings/actions/actions.dart';
import "package:redux/redux.dart";
import "package:poem_and_strings/models/character.dart";

final stageReducer = combineReducers<List<Character>>(
    [TypedReducer<List<Character>, GetStageDataAction>(_getStage)]);

List<Character> _getStage(
    List<Character> stageData, GetStageDataAction action) {
  return action.stageData;
}
