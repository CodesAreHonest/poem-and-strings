import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:poem_and_strings/models/models.dart';
import 'package:poem_and_strings/widgets/youtube.dart';
import 'success_header.dart';
import 'success_message.dart';
import 'success_rating.dart';
import 'success_coin_amount.dart';
import 'success_footer.dart';

class SuccessPage extends StatefulWidget {
  final String youtubeLink;
  final String background;
  final String stageCount;
  final int goldObtained;
  final int rating;
  final Function onRefreshStage;
  final Player player = Player();

  SuccessPage(
      {@required this.youtubeLink,
      @required this.background,
      @required this.goldObtained,
      @required this.rating,
      @required this.stageCount,
      @required this.onRefreshStage});

  @override
  _SuccessPageState createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  void initState() {
    widget.player.incrementCoin(widget.goldObtained);
    super.initState();
  }

  showBackgroundDialog(BuildContext context) {
    Widget closeButton = FlatButton(
      child: Text("我明白了", style: TextStyle(color: Colors.blue)),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop('dialog');
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("创作背景"),
      content: Text(widget.background),
      actions: [
        closeButton,
      ],
    );

    // show the dialog
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) =>
          WillPopScope(onWillPop: () async => false, child: alert),
    );
  }

  showYoutubeVideo(context) {
    Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (context) => Youtube(youtubeLink: widget.youtubeLink)));
  }

  @override
  Widget build(BuildContext context) {
    String stageCount = widget.stageCount;
    int goldObtained = widget.goldObtained;

    return Scaffold(
        body: SafeArea(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SuccessHeader(),
            SuccessMessage(stageCount: stageCount),
            SuccessCoinAmount(goldObtained: goldObtained),
            SuccessRating(goldObtained: goldObtained),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
              decoration: BoxDecoration(color: Colors.grey[200]),
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                        onPressed: () {
                          showBackgroundDialog(context);
                        },
                        textColor: Colors.white,
                        child: Text('创作背景', style: TextStyle(fontSize: 16.0)),
                        color: Colors.blue[600],
                        padding: EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 16.0)),
                    RaisedButton(
                        onPressed: () {
                          showYoutubeVideo(context);
                        },
                        textColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 16.0),
                        color: Colors.red[700],
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
            ),
            SuccessFooter()
          ],
        ),
      ),
    ));
  }
}
