import "package:flutter/material.dart";

class DifficultySelection extends StatefulWidget {
  @override
  _DifficultySelectionState createState() => _DifficultySelectionState();
}

class _DifficultySelectionState extends State<DifficultySelection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Text('Difficulty')
      )
    );
  }
}
