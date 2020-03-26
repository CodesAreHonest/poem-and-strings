import 'package:flutter/material.dart';

class FirstGuideline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20),
          Text('下面是故诗词的第2个句子。\n请把白色方块放到正确的位置。',
              style: TextStyle(
                  color: Colors.black87, fontSize: 16.0, letterSpacing: 1.1)),
          SizedBox(height: 30),
          Image.asset('assets/guideline/first_step.jpeg', height: 375)
        ],
      ),
    );
  }
}
