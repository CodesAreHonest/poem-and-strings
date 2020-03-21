import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Congratulation extends StatelessWidget {
  Widget successContainer(context) {
    return Positioned(
      child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(8.0),
          height: 300,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(16.0)),
          child: Text('hello from the other side')),
    );
  }

  Widget relativeContainer(context) {
    Widget image = Positioned(
      bottom: 230,
      child: Container(
          width: MediaQuery.of(context).size.width,
          child: Center(
              child: Image.asset('assets/icon/trophie.png',
                  width: 250, height: 250))),
    );

    return Container(
      child: Stack(overflow: Overflow.visible, children: <Widget>[
        successContainer(context),
        image,
      ]),
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
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[relativeContainer(context)],
        ),
      ),
    )));
  }
}
