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
  final String youtubeLink;
  final String background;
  final String stageCount;
  final String originalText;
  final String translation;

  GameBody(
      {Key key,
      this.stageData,
      this.itemPerRow,
      this.numOfRow,
      this.isStageCompleted = false,
      this.onUpdateCharacter,
      this.onSwapCharacter,
      this.onResetStage,
      this.isStageIncompleted = false,
      this.onRefreshStage,
      this.step,
      this.youtubeLink,
      this.background,
      this.maximumSteps,
      this.stageCount,
      this.translation,
      this.originalText})
      : super(key: key);

  @override
  _GameBodyState createState() => _GameBodyState();
}

class _GameBodyState extends State<GameBody> {
  int previousTargetPosition;

  @override
  void didUpdateWidget(GameBody oldWidget) {
    if (widget.isStageCompleted == true) {
      int stepRemaining = widget.maximumSteps - widget.step;
      int goldObtained = stepRemaining;

      int rating = ratingSelector(stepRemaining);
      Future.delayed(const Duration(milliseconds: 1000), () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => SuccessPage(
                    youtubeLink: widget.youtubeLink,
                    background: widget.background,
                    goldObtained: goldObtained,
                    rating: rating,
                    stageCount: widget.stageCount,
                    onRefreshStage: widget.onRefreshStage,
                    originalText: widget.originalText,
                    translation: widget.translation)));
        widget.onResetStage();
        return;
      });
    }

    if (widget.isStageIncompleted == true) {
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
        widget.stageData.elementAt(previousTargetPosition);
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
    await Future.delayed(const Duration(milliseconds: 300), () {
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
    if (isCompleted) {
      return TextStyle(
          color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold);
    }

    if (isSelected) {
      return TextStyle(
          color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.bold);
    }

    if (isSpecial) {
      return TextStyle(
          color: Colors.pink[200], fontSize: 16.0, fontWeight: FontWeight.w800);
    }

    return TextStyle(
        color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.normal);
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

      // map words into character widgets.
      GestureDetector characterWidget = GestureDetector(
        onTap: () {
          Character specificCharacter = stageData[item];
          this.swapCharacter(specificCharacter);
        },
        child: Container(
            decoration: characterDecoration(isSelected, isCompleted, isSpecial),
            padding: EdgeInsets.all(8.0),
            child: Text(character,
                style: characterText(isSelected, isCompleted, isSpecial))),
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

    return gameCharacters;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Container(
            child: Column(
              children: renderCharacters(widget.stageData),
            ),
          ),
        ));
  }
}
