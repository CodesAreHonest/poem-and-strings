import "package:flutter/material.dart";
import "package:flutter/painting.dart";
import 'package:poem_and_strings/data/Character.dart';
import 'package:poem_and_strings/data/DifficultStage/DifficultFirstStage.dart';

class DifficultGameBody extends StatefulWidget {
  @override
  _DifficultGameBodyState createState() => _DifficultGameBodyState();
}

class _DifficultGameBodyState extends State<DifficultGameBody> {
  List<Widget> characters = [];
  DifficultFirstStage firstStage;

  _DifficultGameBodyState() {
    this.firstStage = DifficultFirstStage();
  }

  @override
  void initState() {
    super.initState();
    this.renderCharacters(firstStage.getRandomShuffledData());
  }

  Color characterBorderColor(bool isSelected, bool isCompleted) {
    Color borderColor = Colors.blue[700];

    if (isSelected) {
      borderColor = Colors.blue[200];
    }

    if (isCompleted) {
      borderColor = Colors.green[700];
    }

    return borderColor;
  }

  Color characterBackgroundColor(bool isSelected, bool isCompleted) {
    Color backgroundColor = Colors.blue[700];

    if (isSelected) {
      backgroundColor = Colors.blue[500];
    }

    if (isCompleted) {
      backgroundColor = Colors.green[700];
    }

    return backgroundColor;
  }

  void swapCharacters(Character character) async {
    // the first touch of user will always lighten up the character.
    int characterPosition = firstStage.getCharacterLocation(character);
    character.setSelected(true);

    if (firstStage.getTargetElementPosition() == null) {
      firstStage.updateCharacter(character);
      firstStage.setTargetElementPosition(characterPosition);

      // get all stage data again.
      this.renderCharacters(firstStage.getCurrentStageData());
      return;
    }

    int previousTargetPosition = firstStage.getTargetElementPosition();
    Character previousTarget = firstStage.getCharacterAtPosition(previousTargetPosition);
    bool isSameTarget = identical(character, previousTarget);

    // if both tap are same target, remove the first coloured character.
    if (isSameTarget == true) {
      character.setSelected(false);
      firstStage.updateCharacter(character);
      firstStage.setTargetElementPosition(null);

      this.renderCharacters(firstStage.getCurrentStageData());
      return;
    }

    if (isSameTarget == false) {
      // render second item as selected
      firstStage.updateCharacter(character);
      this.renderCharacters(firstStage.getCurrentStageData());

      await Future.delayed(const Duration(milliseconds: 300), () {
        previousTarget.setSelected(false);
        character.setSelected(false);
        firstStage.updateCharacter(character);
        firstStage.updateCharacter(previousTarget);
        firstStage.swapCharacter(previousTarget, character);
      });

      firstStage.setTargetElementPosition(null);
      this.renderCharacters(firstStage.getCurrentStageData());
    }

    return;
  }

  void renderCharacters(List<Character> stageData) {
    List<Widget> rowWidgets = [];
    List<Widget> gameCharacters = [];
    int numOfRows = firstStage.getTotalStageItems();
    double itemsPerRow = firstStage.getItemsPerRow();

    for (int item = 0; item < numOfRows; item++) {
      String character = stageData[item].getCharacter();
      bool isSelected = stageData[item].getSelected();
      bool isCompleted = stageData[item].getCompleted();
      Color borderColor = this.characterBorderColor(isSelected, isCompleted);
      Color backgroundColor = this.characterBackgroundColor(isSelected, isCompleted);

      // map words into character widgets.
      GestureDetector characterWidget = GestureDetector(
        onTap: () {
          Character specificCharacter = stageData[item];
          this.swapCharacters(specificCharacter);
        },
        child: Container(decoration: BoxDecoration(color: backgroundColor, border: Border.all(color: borderColor, width: 2.0, style: BorderStyle.solid)), padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0), child: Text(character, style: TextStyle(color: Colors.white, fontSize: 16.0))),
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

        gameCharacters.add(rowOfCharacters);
        rowWidgets.clear();
      }
    }

    setState(() {
      characters = gameCharacters;
    });
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
