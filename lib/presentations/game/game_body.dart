import "package:flutter/material.dart";
import "package:flutter/painting.dart";
import "package:poem_and_strings/models/models.dart";
import 'package:poem_and_strings/presentations/success/success.dart';
import 'package:poem_and_strings/selectors/stage_selectors.dart';

class GameBody extends StatefulWidget {
  final List<Character> stageData;
  final double itemPerRow;
  final int numOfRow;
  final bool isStageCompleted;
  final bool isStageIncompleted;
  final Function(Character) onUpdateCharacter;
  final Function(List<Character>, Character, Character) onSwapCharacter;
  final Function onRefreshStage;
  final Function onResetStage;

  final int step;
  final int maximumSteps;
  final int level;
  final String youtubeLink;
  final String stageCount;
  final String originalText;
  final String translation;
  final String difficulty;

  GameBody(
      {Key? key,
      required this.stageData,
      required this.itemPerRow,
      required this.numOfRow,
      this.isStageCompleted = false,
      required this.onUpdateCharacter,
      required this.onSwapCharacter,
      required this.onResetStage,
      this.isStageIncompleted = false,
      required this.onRefreshStage,
      required this.step,
      required this.youtubeLink,
      required this.maximumSteps,
      required this.stageCount,
      required this.translation,
      required this.originalText,
      required this.level,
      required this.difficulty})
      : super(key: key);

  @override
  _GameBodyState createState() => _GameBodyState();
}

class _GameBodyState extends State<GameBody> {
  int? previousTargetPosition;

  @override
  void didUpdateWidget(GameBody oldWidget) {
    if (widget.isStageCompleted == true) {
      int stepRemaining = widget.maximumSteps - widget.step;
      int goldObtained = stepRemaining;

      int rating = ratingSelector(stepRemaining);

      Future.delayed(Duration.zero, () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => SuccessPage(
                    difficulty: widget.difficulty,
                    youtubeLink: widget.youtubeLink,
                    goldObtained: goldObtained,
                    rating: rating,
                    stageCount: widget.stageCount,
                    onRefreshStage: widget.onRefreshStage,
                    originalText: widget.originalText,
                    level: widget.level,
                    translation: widget.translation)));
        widget.onResetStage();
        return;
      });
    }

    if (widget.isStageCompleted == false && widget.isStageIncompleted == true) {
      Future.delayed(const Duration(milliseconds: 500), () {
        showGameIncompletedDialog(context);
        return;
      });
    }

    super.didUpdateWidget(oldWidget);
  }

  showGameIncompletedDialog(BuildContext context) {
    // set up the button
    Widget cancelButton = TextButton(
      child: Text("回到主页", style: TextStyle(color: Colors.grey)),
      onPressed: () {
        widget.onResetStage();
        Navigator.pushNamedAndRemoveUntil(
            context, '/EasyStageSelection', (e) => false);
      },
    );
    Widget okButton = TextButton(
      child: Text("再试一次！",
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
      onPressed: () {
        widget.onRefreshStage();
        Navigator.of(context, rootNavigator: true).pop('dialog');
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("你已经用完了所有步数"),
      content: Text("请问你还要再试多一次吗？"),
      actions: [
        cancelButton,
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) =>
          WillPopScope(onWillPop: () async => false, child: alert),
    );
  }

  void swapCharacter(Character currentCharacter) {
    int characterPosition =
        characterPositionSelector(widget.stageData, currentCharacter);
    currentCharacter.setSelected(true);

    bool isCompleted = currentCharacter.completed;

    // if the target is at the right place, shall not able to swap.
    if (isCompleted) {
      return;
    }

    if (previousTargetPosition == null) {
      selectCharacter(currentCharacter, characterPosition);
      return;
    }

    Character previousTarget =
        widget.stageData.elementAt(previousTargetPosition!);
    bool isSameTarget = identical(currentCharacter, previousTarget);

    if (isSameTarget == true) {
      unSelectCharacter(currentCharacter);
      return;
    }

    selectCharacter(currentCharacter, characterPosition);
    onSwapCharacter(previousTarget, currentCharacter);
    return;
  }

  void selectCharacter(Character currentCharacter, int characterPosition) {
    widget.onUpdateCharacter(currentCharacter);
    previousTargetPosition = characterPosition;
  }

  void unSelectCharacter(Character currentCharacter) {
    currentCharacter.setSelected(false);
    widget.onUpdateCharacter(currentCharacter);
    previousTargetPosition = null;
    return;
  }

  void onSwapCharacter(
      Character previousCharacter, Character currentCharacter) async {
    await Future.delayed(Duration(milliseconds: 150), () {
      previousCharacter.setSelected(false);
      currentCharacter.setSelected(false);
      widget.onUpdateCharacter(previousCharacter);
      widget.onUpdateCharacter(currentCharacter);
      widget.onSwapCharacter(
          widget.stageData, previousCharacter, currentCharacter);
      previousTargetPosition = null;
    });

    return;
  }

  BoxDecoration characterDecoration(
      bool isSelected, bool isCompleted, bool isSpecial) {
    if (isCompleted) {
      return BoxDecoration(
          color: Colors.lightGreen,
          border: Border(
              left: BorderSide(color: Colors.black54, width: 2.0),
              right: BorderSide(color: Colors.black54, width: 3.0),
              top: BorderSide(color: Colors.black54, width: 2.0),
              bottom: BorderSide(color: Colors.black54, width: 5.0)));
    }

    if (isSelected) {
      return BoxDecoration(
          color: Color.fromRGBO(239, 239, 239, 1),
          border: Border(
              left: BorderSide(color: Colors.black54, width: 2.0),
              right: BorderSide(color: Colors.black54, width: 3.0),
              top: BorderSide(color: Colors.black54, width: 2.0),
              bottom: BorderSide(color: Colors.black54, width: 5.0)));
    }

    if (isSpecial) {
      return BoxDecoration(
          color: Color.fromRGBO(239, 239, 239, 1),
          border: Border(
              left: BorderSide(color: Colors.transparent, width: 2.0),
              right: BorderSide(color: Colors.transparent, width: 3.0),
              top: BorderSide(color: Colors.transparent, width: 2.0),
              bottom: BorderSide(color: Colors.transparent, width: 5.0)));
    }

    return BoxDecoration(
        color: Color.fromRGBO(239, 239, 239, 1),
        border: Border(
            left: BorderSide(color: Colors.transparent, width: 2.0),
            right: BorderSide(color: Colors.transparent, width: 3.0),
            top: BorderSide(color: Colors.transparent, width: 2.0),
            bottom: BorderSide(color: Colors.transparent, width: 5.0)));
  }

  TextStyle characterText(bool isSelected, bool isCompleted, bool isSpecial) {
    double characterFontSize = 16.0;
    if (isCompleted) {
      return TextStyle(
          color: Colors.white,
          fontSize: characterFontSize,
          fontWeight: FontWeight.bold);
    }

    if (isSelected) {
      return TextStyle(
          color: Colors.black,
          fontSize: characterFontSize,
          fontWeight: FontWeight.bold);
    }

    if (isSpecial) {
      return TextStyle(
          color: Colors.pink[200],
          fontSize: characterFontSize,
          fontWeight: FontWeight.w800);
    }

    return TextStyle(
        color: Colors.black,
        fontSize: characterFontSize,
        fontWeight: FontWeight.normal);
  }

  TextStyle indexCharacterText(
      bool isSelected, bool isCompleted, bool isSpecial) {
    double characterFontSize = 12.0;
    if (isCompleted) {
      return TextStyle(
          color: Colors.white,
          fontSize: characterFontSize,
          fontWeight: FontWeight.bold);
    }

    if (isSelected) {
      return TextStyle(
          color: Colors.black,
          fontSize: characterFontSize,
          fontWeight: FontWeight.bold);
    }

    if (isSpecial) {
      return TextStyle(
          color: Colors.pink[200],
          fontSize: characterFontSize,
          fontWeight: FontWeight.w800);
    }

    return TextStyle(
        color: Colors.black,
        fontSize: characterFontSize,
        fontWeight: FontWeight.normal);
  }

  List<Widget> renderCharacters(List<Character> stageData) {
    List<Widget> rowWidgets = [];
    List<Widget> gameCharacters = [];
    int totalItems = stageData.length;
    double itemsPerRow = widget.itemPerRow;

    for (int item = 0; item < totalItems; item++) {
      String character = stageData[item].getCharacter();
      bool isSelected = stageData[item].getSelected();
      bool isCompleted = stageData[item].getCompleted();
      bool isSpecial = stageData[item].getSpecial();

      Map<int, String> splitedCharacter = character.split('').asMap();
      String firstChar = splitedCharacter[0] ?? '';
      String secondChar = splitedCharacter[1] ?? '';

      Positioned characterNumber = Positioned(
          right: 5,
          top: 2,
          child: Text(secondChar,
              style: indexCharacterText(isSelected, isCompleted, isSpecial)));

      // map words into character widgets.
      GestureDetector characterWidget = GestureDetector(
        onTap: () {
          Character specificCharacter = stageData[item];
          this.swapCharacter(specificCharacter);
        },
        child: Stack(children: <Widget>[
          Container(
              decoration:
                  characterDecoration(isSelected, isCompleted, isSpecial),
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              child: Text(firstChar,
                  style: characterText(isSelected, isCompleted, isSpecial))),
          characterNumber
        ]),
      );

      rowWidgets.add(characterWidget);

      // when item position reach specific count, split to another row.
      int itemPosition = item + 1;
      if (itemPosition % itemsPerRow == 0) {
        Widget rowOfCharacters = Container(
          padding: EdgeInsets.symmetric(vertical: 4.0),
          child: Wrap(
            spacing: 4.0,
            children: [...rowWidgets],
          ),
        );

        gameCharacters.add(rowOfCharacters);
        rowWidgets.clear();
      }
    }

    return gameCharacters;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
            color: Colors.white70, borderRadius: BorderRadius.circular(8.0)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: Container(
            child: Column(
              children: renderCharacters(widget.stageData),
            ),
          ),
        ));
  }
}
