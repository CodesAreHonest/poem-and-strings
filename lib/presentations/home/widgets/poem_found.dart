import "package:flutter/material.dart";

class PoemFound extends StatelessWidget {
  final int totalStageCompleted;

  PoemFound({required this.totalStageCompleted});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("你一共找到 $totalStageCompleted 首诗词",
          style: TextStyle(
              fontSize: 20.0, letterSpacing: 1.2, color: Colors.blue[800])),
    );
  }
}
