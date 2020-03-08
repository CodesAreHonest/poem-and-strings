import "package:flutter/material.dart";

class GameTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [BoxShadow(
                color: Colors.grey[300],
                blurRadius: 15.0,
                spreadRadius: 5.0
            ),]
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 32.0),
          child: Text("诗词串串乐", style: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.2,
              color: Colors.blue[400]
          )),
        )
    );
  }
}
