import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:poem_and_strings/actions/music_actions.dart';
import 'package:poem_and_strings/states/states.dart';
import 'package:redux/redux.dart';

final musicReducer = combineReducers<MusicState>([
  TypedReducer<MusicState, StartMusicActions>(_startMusic),
  TypedReducer<MusicState, StopMusicActions>(_stopMusic),
  TypedReducer<MusicState, PauseMusicActions>(_pauseMusic),
  TypedReducer<MusicState, ResumeMusicAction>(_resumeMusic)
]);

MusicState _startMusic(MusicState musicState, StartMusicActions action) {
  AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer();
  _assetsAudioPlayer.open('assets/musics/background_music.mp3');
  _assetsAudioPlayer.loop = true;
  _assetsAudioPlayer.play();
  return musicState.copyWith(assetsAudioPlayer: _assetsAudioPlayer);
}

MusicState _stopMusic(MusicState musicStates, StopMusicActions action) {
  AssetsAudioPlayer _assetsAudioPlayer = musicStates.assetsAudioPlayer;
  _assetsAudioPlayer.stop();
  return musicStates.copyWith(assetsAudioPlayer: _assetsAudioPlayer);
}

MusicState _pauseMusic(MusicState musicState, PauseMusicActions action) {
  AssetsAudioPlayer _assetsAudioPlayer = musicState.assetsAudioPlayer;
  _assetsAudioPlayer.pause();
  return musicState.copyWith(assetsAudioPlayer: _assetsAudioPlayer);
}

MusicState _resumeMusic(MusicState musicState, ResumeMusicAction action) {
  AssetsAudioPlayer _assetsAudioPlayer = musicState.assetsAudioPlayer;
  bool isMusicPlaying = _assetsAudioPlayer.isPlaying.value;

  if (isMusicPlaying) {
    return musicState.copyWith(assetsAudioPlayer: _assetsAudioPlayer);
  }

  _assetsAudioPlayer.play();
  return musicState.copyWith(assetsAudioPlayer: _assetsAudioPlayer);
}
