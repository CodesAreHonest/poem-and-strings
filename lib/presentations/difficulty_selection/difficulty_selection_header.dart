import 'package:flutter/material.dart';

class DifficultySelectionHeader extends StatelessWidget {
  const DifficultySelectionHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Ink(
            decoration: ShapeDecoration(
              color: Colors.lightBlue,
              shape: CircleBorder(),
            ),
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              color: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, "/Home");
              },
            )),
        SizedBox(width: 40.0),
        Text('选择游戏难度',
            style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.2,
                fontSize: 20))
      ],
    );
  }
}
