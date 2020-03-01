import "package:flutter/material.dart";
import 'package:flutter/painting.dart';
import 'dart:async';

class DifficultGameBody extends StatefulWidget {
  @override
  _GameBodyState createState() => _GameBodyState();
}

class Character {
  int x;
  int y;
  String character;
  bool selected;
  bool completed;
  int location;

  Character(this.x, this.y, this.character, this.selected, this.completed,
      this.location);

  void setSelected(bool selected) {
    this.selected = selected;
  }

  void setCharacter(String character) {
    this.character = character;
  }

  int getLocation() => this.location;

  String getCharacter() => this.character;
}

class _GameBodyState extends State<DifficultGameBody> {
  List<Character> data = [
    Character(0, 0, "爆", false, false, 0),
    Character(1, 0, "竹", false, false, 1),
    Character(2, 0, "声", false, false, 2),
    Character(3, 0, "中", false, false, 3),
    Character(4, 0, "一", false, false, 4),
    Character(5, 0, "声", false, false, 5),
    Character(6, 0, "爆", false, false, 6),
    Character(0, 1, "春", false, false, 7),
    Character(1, 1, "风", false, false, 8),
    Character(2, 1, "送", false, false, 9),
    Character(3, 1, "暖", false, false, 10),
    Character(4, 1, "入", false, false, 11),
    Character(5, 1, "屠", false, false, 12),
    Character(6, 1, "苏", false, false, 13),
    Character(0, 2, "千", false, false, 14),
    Character(1, 2, "门", false, false, 15),
    Character(2, 2, "万", false, false, 16),
    Character(3, 2, "户", false, false, 17),
    Character(4, 2, "曈", false, false, 18),
    Character(5, 2, "曈", false, false, 19),
    Character(6, 2, "日", false, false, 20),
    Character(0, 3, "总", false, false, 21),
    Character(1, 3, "把", false, false, 22),
    Character(2, 3, "新", false, false, 23),
    Character(3, 3, "桃", false, false, 24),
    Character(4, 3, "换", false, false, 25),
    Character(5, 3, "旧", false, false, 26),
    Character(6, 3, "符", false, false, 27)
  ];

  int targetElement;

  void swapCharacter(Character character) async {
    List<Character> characterData = data;
    int elementPosition = characterData.indexOf(character);
    character.setSelected(true);

    if (targetElement == null) {
      characterData.removeAt(elementPosition);
      characterData.insert(elementPosition, character);

      setState(() {
        data = characterData;
        targetElement = elementPosition;
      });

      return;
    }

    Character destination = characterData.elementAt(targetElement);
    bool isSameTarget = identical(character, destination);

    if (isSameTarget == true) {
      character.setSelected(false);
      characterData.removeAt(elementPosition);
      characterData.insert(elementPosition, character);

      setState(() {
        data = characterData;
        targetElement = null;
      });

      return;
    }

    if (isSameTarget == false) {
      // set secondary selected colours
      characterData.removeAt(elementPosition);
      characterData.insert(elementPosition, character);

      setState(() {
        data = characterData;
      });

      // swap characters
      String destinationCharacter = character.getCharacter();
      String targetCharacter = destination.getCharacter();
      destination.setCharacter(destinationCharacter);
      character.setCharacter(targetCharacter);

      await Future.delayed(const Duration(milliseconds: 500), () {
        destination.setSelected(false);
        character.setSelected(false);

        // swap position
        characterData.removeAt(elementPosition);
        characterData.insert(elementPosition, character);
        characterData.removeAt(targetElement);
        characterData.insert(targetElement, destination);
      });

      setState(() {
        data = characterData;
        targetElement = null;
      });

      return;
    }
  }

  List<Widget> renderCharacters(List<Character> words, int index) {
    List<Widget> wordList = new List<Widget>();
    List<Character> row =
        words.where((Character item) => item.y == index).toList();

    for (int i = 0; i < row.length; i++) {
      String character = row[i].character;
      bool selected = row[i].selected;
      Color borderColor = Colors.blue[700];
      Color backgroundColor = Colors.blue[700];

      if (selected) {
        backgroundColor = Colors.blue[500];
        borderColor = Colors.blue[500];
      }

      if (words.elementAt(i).getLocation() == i) {
        backgroundColor = Colors.green[500];
        borderColor = Colors.green[500];
      }

      wordList.add(GestureDetector(
        onTap: () {
          swapCharacter(row[i]);
        },
        child: Container(
            decoration: BoxDecoration(
                color: backgroundColor,
                border: Border.all(
                    color: borderColor, width: 2.0, style: BorderStyle.solid)),
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: Text(character,
                style: TextStyle(color: Colors.white, fontSize: 16.0))),
      ));
    }

//    wordList.shuffle();

    return wordList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: EdgeInsets.all(16.0),
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 4.0),
              child: Wrap(
                spacing: 8.0,
                children: renderCharacters(data, 0),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 4.0),
              child: Wrap(
                spacing: 8.0,
                children: renderCharacters(data, 1),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 4.0),
              child: Wrap(
                spacing: 8.0,
                children: renderCharacters(data, 2),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 4.0),
              child: Wrap(
                spacing: 8.0,
                children: renderCharacters(data, 3),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
