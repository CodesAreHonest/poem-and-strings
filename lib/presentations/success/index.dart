import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SuccessPage extends StatelessWidget {
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
              decoration: BoxDecoration(color: Colors.grey[400]),
              child: Text('Congratulations',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.redAccent[700])),
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 32.0),
                decoration: BoxDecoration(color: Colors.red[200]),
                child: Text('Congratulations on complete second stage, you will received...',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, color: Colors.black)))
          ],
        ),
      ),
    ));
  }
}
