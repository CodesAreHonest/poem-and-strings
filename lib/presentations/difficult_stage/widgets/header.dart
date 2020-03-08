import "package:flutter/material.dart";

class DifficultStageHeader extends StatefulWidget {
  DifficultStageHeader();

  @override
  _DifficultStageHeaderState createState() => _DifficultStageHeaderState();
}

class _DifficultStageHeaderState extends State<DifficultStageHeader> {
  _DifficultStageHeaderState();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.blue[100]),
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('第二关'),
          Text("1/10 步"),
          Text('Coin: 57'),
        ],
      ),
    );
  }
}
