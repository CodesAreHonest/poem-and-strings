import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter_youtube/flutter_youtube.dart';

class YoutubeVideo extends StatefulWidget {
  final String youtubeLink;

  YoutubeVideo({@required this.youtubeLink});

  @override
  State<StatefulWidget> createState() {
    return _YoutubeVideoState();
  }
}

class _YoutubeVideoState extends State<YoutubeVideo> {
  YoutubePlayerController _youtubePlayerController;

  void playYoutubeVideo() {
    FlutterYoutube.playYoutubeVideoById(
        apiKey: env['YOUTUBE_API_KEY'], videoId: widget.youtubeLink);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _youtubePlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: new ElevatedButton(
            child: new Text("Play Default Video"), onPressed: playYoutubeVideo),
      ),
    );
  }
}
