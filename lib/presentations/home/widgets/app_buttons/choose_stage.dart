import "package:flutter/material.dart";

class ChooseStage extends StatelessWidget {
  Future navigateToSubPage(context) async {
    Navigator.pushNamed(context, '/DifficultySelection');
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          navigateToSubPage(context);
        },
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0))),
            padding: MaterialStateProperty.all(EdgeInsets.zero),
            textStyle:
                MaterialStateProperty.all(TextStyle(color: Colors.white))),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            gradient: LinearGradient(colors: <Color>[
              Colors.blue[800],
              Colors.blue[700],
              Colors.blue[600],
              Colors.blue[500],
            ]),
          ),
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          child: Text('选择关卡', style: TextStyle(fontSize: 24)),
        ));
  }
}
