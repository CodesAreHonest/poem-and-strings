import "package:flutter/material.dart";
import "package:flutter/painting.dart";
import 'package:poem_and_strings/data/Character.dart';
import 'package:poem_and_strings/data/EasyStage/EasyFirstStage.dart';

class DifficultGameBodyTwo extends StatefulWidget {
  @override
  _DifficultGameBodyTwoState createState() => _DifficultGameBodyTwoState();
}

class _DifficultGameBodyTwoState extends State<DifficultGameBodyTwo> {
  List<Widget> characters = [];
  EasyFirstStage firstStage;

  _DifficultGameBodyTwoState() {
    this.firstStage = EasyFirstStage();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.renderCharacters(firstStage.getRandomShuffledData());
  }

  Color characterBorderColor(bool isSelected) {
    Color borderColor = Colors.blue[700];

    if (isSelected) {
      borderColor = Colors.blue[200];
    }

    return borderColor;
  }

  Color characterBackgroundColor(bool isSelected) {
    Color backgroundColor = Colors.blue[700];

    if (isSelected) {
      backgroundColor = Colors.blue[500];
    }

    return backgroundColor;
  }

  void swapCharacters(Character character) {
    print(character.getCharacter());
  }

  void renderCharacters(List<Character> stageData) {
    List<Widget> rowWidgets = [];
    int numOfRows = firstStage.getTotalStageItems();
    double itemsPerRow = firstStage.getItemsPerRow();

    for (int item = 0; item < numOfRows; item++) {
      String character = stageData[item].getCharacter();
      bool isSelected = stageData[item].getSelected();
      Color borderColor = this.characterBorderColor(isSelected);
      Color backgroundColor = this.characterBackgroundColor(isSelected);

      // map words into character widgets.
      GestureDetector characterWidget = GestureDetector(
        onTap: () {
          this.swapCharacters(stageData[item]);
        },
        child: Container(
            decoration: BoxDecoration(
                color: backgroundColor,
                border: Border.all(
                    color: borderColor, width: 2.0, style: BorderStyle.solid)),
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: Text(character,
                style: TextStyle(color: Colors.white, fontSize: 16.0))),
      );
      rowWidgets.add(characterWidget);

      // when item position reach specific count, split to another row.
      int itemPosition = item + 1;
      if (itemPosition % itemsPerRow == 0) {
        Widget rowOfCharacters = Container(
          padding: EdgeInsets.symmetric(vertical: 4.0),
          child: Wrap(
            spacing: 8.0,
            children: [...rowWidgets],
          ),
        );

        characters.add(rowOfCharacters);
        rowWidgets.clear();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: EdgeInsets.all(16.0),
      child: Container(
        child: Column(
          children: characters,
        ),
      ),
    ));
  }
}
