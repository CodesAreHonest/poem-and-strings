import "package:flutter/material.dart";

class DifficultStageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
                child: Column(children: <Widget>[
      Container(
        decoration: BoxDecoration(color: Colors.blue[100]),
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('第二关'),
            Text('1/10 步'),
            Text('Coin: 57'),
          ],
        ),
      ),
      Container(
        decoration: BoxDecoration(color: Colors.blue[200]),
        padding: EdgeInsets.all(16.0),
        width: MediaQuery.of(context).size.width,
        child: Container(
          width: 100,
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('[译文]',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white70,
                      fontSize: 16,
                      letterSpacing: 1.2)),
              SizedBox(height: 8.0),
              Text(
                  '“元日”  是农历正月初一，也就是现在的春节。'
                  '这是一首写古代迎接新年的即景之作。'
                  '歌颂春节的诗很多。',
                  style: TextStyle(
                      color: Colors.white, fontSize: 12, letterSpacing: 1.2)),
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.blue[300],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0))),
        ),
      )
    ]))));
  }
}
