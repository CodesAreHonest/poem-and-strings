import "package:flutter/material.dart";

class PoemFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("你一共找到 2 首诗词", style: TextStyle(
          fontSize: 20.0,
          letterSpacing: 1.2,
          color: Colors.blue[800]
      )),
    );
  }
}
