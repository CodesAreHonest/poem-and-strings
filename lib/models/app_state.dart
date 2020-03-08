import 'package:poem_and_strings/states/states.dart';

class AppState {
  final StageState stageState;

  AppState({this.stageState = const StageState(data: [])});

  AppState copyWith({StageState stageState}) {
    return AppState(stageState: stageState ?? this.stageState);
  }

  @override
  String toString() {
    return 'AppState{stageState: $stageState}';
  }
}
