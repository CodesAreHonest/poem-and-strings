import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Congratulation extends StatelessWidget {
  Widget successContainer(context) {
    Widget nextActivityButton = ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, '/RevisionGuideline');
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color?>(Colors.blue[700]),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            EdgeInsets.symmetric(horizontal: 80.0, vertical: 16.0)),
        shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: BorderSide(color: Colors.blue.shade800))),
      ),
      child: Text('下一个活动', style: TextStyle(color: Colors.white, fontSize: 16)),
    );

    Widget backToHomeButton = TextButton(
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(
              context, '/DifficultySelection', (e) => false);
        },
        style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                EdgeInsets.symmetric(horizontal: 80.0, vertical: 16.0)),
            shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)))),
        child: Text('回到主页',
            style: TextStyle(color: Colors.blue[800], fontSize: 16)));

    return Positioned(
      child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(8.0, 40.0, 8.0, 8.0),
          margin: EdgeInsets.symmetric(horizontal: 16.0),
          height: 300,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0), color: Colors.white),
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
        decoration: BoxDecoration(
          color: Colors.grey[100],
          image: DecorationImage(
              image: AssetImage('assets/background/success_bg.jpg'),
              fit: BoxFit.fill),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Stack(clipBehavior: Clip.none, children: <Widget>[
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
