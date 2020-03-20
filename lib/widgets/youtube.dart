import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:video_player/video_player.dart';

class Youtube extends StatefulWidget {
  final String youtubeLink;

  Youtube({@required this.youtubeLink});

  @override
  _YoutubePlayerState createState() => _YoutubePlayerState();
}

class _YoutubePlayerState extends State<Youtube> {
  YoutubePlayerController _controller;

  @override
  void initState() {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    _controller = YoutubePlayerController(
        initialVideoId: widget.youtubeLink,
        flags: YoutubePlayerFlags(
            autoPlay: false, mute: false, disableDragSeek: true));

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.blue,
            onReady: () async {
              print('video ready');
            },
            onEnded: (meta) {
              _controller
                ..seekTo(Duration.zero)
                ..pause();
            },
            bottomActions: <Widget>[
          const SizedBox(width: 14.0),
          CurrentPosition(),
          const SizedBox(width: 8.0),
          ProgressBar(isExpanded: true),
          RemainingDuration(),
          const PlaybackSpeedButton(),
        ]));
  }
}
