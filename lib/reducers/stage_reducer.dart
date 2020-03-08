import 'package:poem_and_strings/actions/actions.dart';
import 'package:poem_and_strings/models/models.dart';
import "package:redux/redux.dart";

final stageReducer =
    combineReducers<List<Character>>([TypedReducer(_getStage)]);

List<Character> _getStage(
    List<Character> stageData, GetStageDataAction action) {
  return action.getStageData();
}
