import "package:flutter/material.dart";
import "package:flutter/painting.dart";
import "package:poem_and_strings/models/models.dart";

class GameBody extends StatefulWidget {
  List<Character> stageData = [];
  double itemPerRow = 0;
  int numOfRow = 0;

  GameBody({this.stageData, this.itemPerRow, this.numOfRow});

  @override
  _GameBodyState createState() => _GameBodyState();
}

class _GameBodyState extends State<GameBody> {
  List<Widget> characters = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    renderCharacters(widget.stageData);
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

  void renderCharacters(List<Character> stageData) {
    List<Widget> rowWidgets = [];
    List<Widget> gameCharacters = [];
    int totalItems = stageData.length;
    double itemsPerRow = widget.itemPerRow;

    for (int item = 0; item < totalItems; item++) {
      String character = stageData[item].getCharacter();
      bool isSelected = stageData[item].getSelected();
      bool isCompleted = stageData[item].getCompleted();

      Color borderColor = this.characterBorderColor(isSelected, isCompleted);
      Color backgroundColor =
          this.characterBackgroundColor(isSelected, isCompleted);

      // map words into character widgets.
      GestureDetector characterWidget = GestureDetector(
        onTap: () {
          Character specificCharacter = stageData[item];
//          this.swapCharacters(specificCharacter);
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
