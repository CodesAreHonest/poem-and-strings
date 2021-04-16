import "package:flutter/material.dart";

final Shader linearGradient = LinearGradient(
  colors: <Color>[Colors.red, Colors.red.shade800],
).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

class GameTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Text("诗词串串乐",
          style: TextStyle(
              fontSize: 50.0,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.2,
              foreground: Paint()..shader = linearGradient)),
    );
  }
}
