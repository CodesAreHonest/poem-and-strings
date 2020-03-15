import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:poem_and_strings/widgets/stage_rating.dart';
import 'package:poem_and_strings/widgets/youtube.dart';

class SuccessPage extends StatelessWidget {
  final String youtubeLink;
  final String background;
  final String stageCount;
  final int goldObtained;
  final int rating;
  final Function onRefreshStage;

  SuccessPage(
      {@required this.youtubeLink,
      @required this.background,
      @required this.goldObtained,
      @required this.rating,
      @required this.stageCount,
      @required this.onRefreshStage});

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
      content: Text(this.background),
      actions: [
        closeButton,
      ],
    );

    // show the dialog
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => WillPopScope(onWillPop: () async => false, child: alert),
    );
  }

  showYoutubeVideo(context) {
    Navigator.push(
        context, CupertinoPageRoute(builder: (context) => Youtube(youtubeLink: this.youtubeLink)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
              decoration: BoxDecoration(color: Colors.grey[200]),
              child: Text('恭喜过关 ！',
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 32, color: Colors.black)),
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 32.0),
                decoration: BoxDecoration(color: Colors.grey[100]),
                child: Text('恭喜完成$stageCount，你将获得',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.black))),
            Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(color: Colors.white24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('assets/stack-of-coins.png', width: 150, height: 150),
                    Text('x $goldObtained',
                        style: TextStyle(
                            fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold))
                  ],
                )),
            Center(
              child: Container(
                  decoration: BoxDecoration(color: Colors.white30),
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: StageRating(value: this.rating, size: 45)),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
              decoration: BoxDecoration(color: Colors.grey[100]),
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
                      padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0)),
                  RaisedButton(
                      onPressed: () {
                        showYoutubeVideo(context);
                      },
                      textColor: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
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
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: RaisedButton.icon(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/EasyStageSelection', (e) => false);
                    },
                    color: Colors.green[500],
                    icon: Icon(Icons.thumb_up, size: 12, color: Colors.white),
                    label: Text('完成', style: TextStyle(color: Colors.white))),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
