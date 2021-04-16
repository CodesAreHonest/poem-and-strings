import 'package:flutter/material.dart';
import 'package:poem_and_strings/presentations/difficulty_selection/difficult_selection_body/easy_button.dart';
import './difficult_button.dart';
import './easy_button.dart';

class DifficultySelectionBody extends StatelessWidget {
  const DifficultySelectionBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              EasyButton(),
              DifficultButton(),
            ],
          ),
        ],
      ),
    );
  }
}
