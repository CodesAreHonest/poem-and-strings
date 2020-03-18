import 'package:assets_audio_player/assets_audio_player.dart';
import "package:flutter/foundation.dart";

class MusicState {
  final AssetsAudioPlayer assetsAudioPlayer;

  const MusicState({@required this.assetsAudioPlayer});

  MusicState copyWith({AssetsAudioPlayer assetsAudioPlayer}) =>
      MusicState(assetsAudioPlayer: assetsAudioPlayer ?? this.assetsAudioPlayer);
}
