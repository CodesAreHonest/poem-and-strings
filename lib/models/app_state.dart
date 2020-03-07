import 'package:poem_and_strings/models/character.dart';

class AppState {
  final List<Character> stageData;

  AppState({this.stageData = const []});

  AppState copyWith({List<Character> stageData}) {
    return AppState(stageData: stageData ?? this.stageData);
  }

  @override
  String toString() {
    return 'AppState{stageData: $stageData}';
  }
}
