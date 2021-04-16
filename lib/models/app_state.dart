import 'package:poem_and_strings/states/stage_states.dart';
import 'package:poem_and_strings/states/music_states.dart';

class AppState {
  final StageState stageState;
  final MusicState musicState;

  AppState(
      {this.stageState = const StageState(data: []),
      this.musicState = const MusicState(assetsAudioPlayer: null)});

  AppState copyWith(
      {required StageState stageState, required MusicState musicState}) {
    return AppState(stageState: stageState, musicState: musicState);
  }

  @override
  String toString() {
    return 'AppState{stageState: $stageState}';
  }
}
