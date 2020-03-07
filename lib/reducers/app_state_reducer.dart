import 'package:poem_and_strings/models/app_state.dart';
import "package:poem_and_strings/reducers/stage_reducer.dart";

AppState appReducer(AppState state, action) {
  return AppState(stageData: stageReducer(state.stageData, action));
}
