import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share/share.dart';
import 'package:poem_and_strings/models/models.dart';
import 'package:poem_and_strings/presentations/success/success_poems.dart';

import 'success_header.dart';
import 'success_message.dart';
import 'success_rating.dart';
import 'success_coin_amount.dart';
import 'success_footer.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_dotenv/flutter_dotenv.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_youtube/flutter_youtube.dart';

class SuccessPage extends StatefulWidget {
  final String youtubeLink;
  final String stageCount;
  final String originalText;
  final String translation;
  final int goldObtained;
  final int rating;
  final int level;
  final Function onRefreshStage;
  final String difficulty;
  final Player player = Player();

  SuccessPage(
      {required this.youtubeLink,
      required this.goldObtained,
      required this.rating,
      required this.stageCount,
      required this.onRefreshStage,
      required this.originalText,
      required this.difficulty,
      required this.translation,
      required this.level});

  @override
  _SuccessPageState createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  // Create an instance of ScrenshotController
  ScreenshotController screenshotController = ScreenshotController();

  @override
  void initState() {
    widget.player.incrementCoin(widget.goldObtained);
    setGameProgress();
    super.initState();
  }

  void setGameProgress() {
    if (widget.difficulty == 'easy') {
      widget.player.setEasyStageProgress(widget.level, widget.rating);
      return;
    }

    widget.player.setHardStageProgress(widget.level, widget.rating);
  }

  void showYoutubeVideo(context) {
    FlutterYoutube.playYoutubeVideoById(
        apiKey: env['YOUTUBE_API_KEY'], videoId: widget.youtubeLink);
  }

  void share(BuildContext context) async {
    final RenderBox box = context.findRenderObject() as RenderBox;

    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    String fileName = 'success.jpg';

    screenshotController.captureAndSave(tempPath,
        fileName: fileName, delay: Duration(milliseconds: 10));

    Share.shareFiles(['$tempPath/$fileName'],
        subject: "我闯关了！",
        text: "我在诗词串串乐的成绩！",
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }

  @override
  Widget build(BuildContext context) {
    String stageCount = widget.stageCount;
    int goldObtained = widget.goldObtained;

    return Scaffold(
        body: SafeArea(
      child: Container(
        decoration: BoxDecoration(color: Colors.grey[200]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Screenshot(
                controller: screenshotController,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SuccessHeader(),
                      SuccessMessage(stageCount: stageCount),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        margin: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              SuccessRating(rating: widget.rating),
                              SuccessCoinAmount(goldObtained: goldObtained),
                            ]),
                      ),
                      SuccessPoems(
                          originalText: widget.originalText,
                          translation: widget.translation),
                    ])),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(8.0),
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                      style: ButtonStyle(
                          textStyle: MaterialStateProperty.all(
                              TextStyle(color: Colors.white)),
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  horizontal: 24.0, vertical: 8.0)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green[600])),
                      onPressed: () {
                        share(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text('分享', style: TextStyle(color: Colors.white)),
                          SizedBox(width: 8.0),
                          Icon(Icons.add_to_home_screen_outlined,
                              color: Colors.white)
                        ],
                      )),
                  ElevatedButton(
                      style: ButtonStyle(
                          textStyle: MaterialStateProperty.all(
                              TextStyle(color: Colors.white)),
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  horizontal: 24.0, vertical: 8.0)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red[600])),
                      onPressed: () {
                        showYoutubeVideo(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text('观赏影片', style: TextStyle(color: Colors.white)),
                          SizedBox(width: 8.0),
                          Icon(Icons.ondemand_video, color: Colors.white)
                        ],
                      ))
                ],
              ),
            ),
            SuccessFooter(
                stageCount: widget.stageCount, difficulty: widget.difficulty)
          ],
        ),
      ),
    ));
  }
}
