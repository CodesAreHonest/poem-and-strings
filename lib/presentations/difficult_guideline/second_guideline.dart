import 'package:flutter/material.dart';

class SecondGuideline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20),
          Text('如何移动：分别要点击2个交换的字',
              style: TextStyle(
                  color: Colors.black87, fontSize: 16.0, letterSpacing: 1.1)),
          SizedBox(height: 20),
          Image(
              image: AssetImage('assets/guideline/second_step.gif'),
              height: 450,
              width: 300)
        ],
      ),
    );
  }
}
