import 'package:flutter/material.dart';

class ThirdGuideline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20),
          Text('技巧：\n粉红字的格子，代表某些特殊属性。\n先把他们放到合适位置会有意想不到的效果！',
              style: TextStyle(
                  color: Colors.black87, fontSize: 15.0, letterSpacing: 1.1)),
          SizedBox(height: 20.0),
          Image.asset('assets/guideline/third_step.jpeg',
              height: 200, width: 200)
        ],
      ),
    );
  }
}
