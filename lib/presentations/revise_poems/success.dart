import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class RevisionSuccess extends StatelessWidget {
  Widget successContainer(context) {
    Widget backToHomeButton = RaisedButton(
        color: Colors.blue[700],
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(
              context, '/DifficultySelection', (e) => false);
        },
        padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 16.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child:
            Text('回到主页', style: TextStyle(color: Colors.white, fontSize: 16)));

    return Positioned(
      child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(8.0, 40.0, 8.0, 8.0),
          height: 250,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(16.0)),
          child: Column(
            children: <Widget>[
              SizedBox(height: 8.0),
              Text('恭喜闯关成功',
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.red[300],
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 60.0),
              backToHomeButton
            ],
          )),
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
              ]),
            )
          ],
        ),
      ),
    )));
  }
}