import "package:flutter/material.dart";

class ChooseStage extends StatelessWidget {
  Future navigateToSubPage(context) async {
    Navigator.pushNamed(context, '/DifficultySelection');
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        onPressed: () {
          navigateToSubPage(context);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        textColor: Colors.white,
        padding: const EdgeInsets.all(0.0),
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
