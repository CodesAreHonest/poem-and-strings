import 'package:poem_and_strings/actions/stage_actions.dart';
import 'package:poem_and_strings/states/states.dart';
import "package:redux/redux.dart";

final stageReducer = combineReducers<StageState>([TypedReducer(_getStage)]);

StageState _getStage(StageState stageState, GetStageDataAction action) {
  return stageState.copyWith(
      data: action.getStageData(),
      itemPerRow: action.getItemsPerRow(),
      numOfRow: action.getNumberOfRow());
}
