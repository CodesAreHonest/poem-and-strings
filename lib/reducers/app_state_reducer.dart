import 'package:poem_and_strings/models/app_state.dart';
import "package:poem_and_strings/reducers/stage_reducer.dart";

AppState appReducer(AppState state, action) {
  return AppState(stageState: stageReducer(state.stageState, action));
}
