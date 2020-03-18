import 'package:poem_and_strings/states/states.dart';

class AppState {
  final StageState stageState;
  final MusicState musicState;

  AppState(
      {this.stageState = const StageState(data: []),
      this.musicState = const MusicState(assetsAudioPlayer: null)});

  AppState copyWith({StageState stageState, MusicState musicState}) {
    return AppState(
        stageState: stageState ?? this.stageState,
        musicState: musicState ?? this.musicState);
  }

  @override
  String toString() {
    return 'AppState{stageState: $stageState}';
  }
}
