import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Congratulation extends StatelessWidget {
  Widget successContainer(context) {
    Widget nextActivityButton = RaisedButton(
      onPressed: () {},
      color: Colors.blue[700],
      padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 16.0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: BorderSide(color: Colors.blue[800])),
      child: Text('下一个活动', style: TextStyle(color: Colors.white, fontSize: 16)),
    );

    Widget backToHomeButton = FlatButton(
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(
              context, '/DifficultySelection', (e) => false);
        },
        padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 16.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Text('回到主页',
            style: TextStyle(color: Colors.blue[800], fontSize: 16)));

//    Widget guidanceText = Container(
//        padding: EdgeInsets.symmetric(horizontal: 16.0),
//        child: RichText(
//            text: TextSpan(
//                style: TextStyle(
//                    fontSize: 18.0,
//                    letterSpacing: 1.1,
//                    color: Colors.black54,
//                    fontWeight: FontWeight.bold),
//                children: <TextSpan>[
//              TextSpan(text: '背诵古诗:\n'),
//              TextSpan(
//                  text: '请录制自己背诵古诗的视频，并上传到面子书班群',
//                  style: TextStyle(
//                      color: Colors.black54,
//                      fontWeight: FontWeight.normal,
//                      height: 1.5))
//            ])));

    return Positioned(
      child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(8.0, 40.0, 8.0, 8.0),
          height: 300,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(16.0)),
          child: Column(
            children: <Widget>[
              SizedBox(height: 8.0),
              Text('恭喜闯关成功',
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 60.0),
              nextActivityButton,
              SizedBox(height: 8.0),
              backToHomeButton
            ],
          )),
    );
  }

  Widget trophieImage(context) {
    return Positioned(
      bottom: 225,
      child: Container(
          width: MediaQuery.of(context).size.width,
          child: Center(
              child: Image.asset('assets/icon/trophie.png',
                  width: 250, height: 250))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Align(
      alignment: Alignment.center,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Colors.grey[100]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Stack(overflow: Overflow.visible, children: <Widget>[
                successContainer(context),
                trophieImage(context),
              ]),
            )
          ],
        ),
      ),
    )));
  }
}
