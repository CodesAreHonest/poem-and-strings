import "package:flutter/material.dart";
import 'package:flutter/painting.dart';

class DifficultGameBody extends StatefulWidget {
  @override
  _GameBodyState createState() => _GameBodyState();
}

class StageCharacter {
  final int x;
  final int y;
  final String character;
  final bool selected;

  const StageCharacter(this.x, this.y, this.character, this.selected);
}

class _GameBodyState extends State<DifficultGameBody> {
  final List<StageCharacter> data = [
    StageCharacter(0, 0, "爆", false),
    StageCharacter(1, 0, "竹", false),
    StageCharacter(2, 0, "声", false),
    StageCharacter(3, 0, "中", false),
    StageCharacter(4, 0, "一", false),
    StageCharacter(5, 0, "声", false),
    StageCharacter(6, 0, "爆", false),
  ];

  List<Widget> getWordsArrangement(List<StageCharacter> words) {
    List<Widget> wordList = new List<Widget>();
    List<StageCharacter> firstRow =
        words.where((StageCharacter item) => item.y == 0).toList();

    for (int i = 0; i < firstRow.length; i++) {
      String character = firstRow[i].character;

      wordList.add(Container(
          color: Colors.blue[700],
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
          child: Text(character,
              style: TextStyle(color: Colors.white, fontSize: 16.0))));
    }

    wordList.add(Container(
        color: Colors.transparent,
        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: Text(",",
            style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.w600))));

    return wordList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
          child: Wrap(
        spacing: 5.0,
        runSpacing: 10.0,
        children: [...getWordsArrangement(data)],
      )),
    ));
  }
}
