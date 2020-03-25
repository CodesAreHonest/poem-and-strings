import 'package:flutter/material.dart';

class RevisionGuideline extends StatelessWidget {
  final Widget guidanceText = Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: RichText(
          text: TextSpan(
              style: TextStyle(
                  fontSize: 18.0,
                  letterSpacing: 1.0,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600),
              children: <TextSpan>[
            TextSpan(text: '背诵古诗:\n'),
            TextSpan(
                text: '请录制自己背诵古诗的视频，并上传到面子书班群',
                style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.normal,
                    height: 1.6))
          ])));

  Widget enterChallengeButton(BuildContext context) => RaisedButton(
      color: Colors.blue[700],
      onPressed: () {
        Navigator.pushNamedAndRemoveUntil(
            context, '/RevisePoems', (e) => false);
      },
      padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Text('进入挑战', style: TextStyle(color: Colors.white, fontSize: 16)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Align(
      alignment: Alignment.center,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.grey[100],
            image: DecorationImage(
                image: AssetImage('assets/background/third_bg.jpg'),
                fit: BoxFit.fill)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                    decoration: BoxDecoration(color: Colors.white),
                    padding:
                        EdgeInsets.symmetric(horizontal: 40.0, vertical: 32.0),
                    child: Column(children: <Widget>[
                      guidanceText,
                      SizedBox(height: 16.0),
                      enterChallengeButton(context),
                    ])))
          ],
        ),
      ),
    )));
  }
}
