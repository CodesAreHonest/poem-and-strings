import "package:flutter/material.dart";
import 'package:poem_and_strings/models/player.dart';
import 'difficult_selection_body/index.dart';

class DifficultySelection extends StatefulWidget {
  @override
  _DifficultySelectionState createState() => _DifficultySelectionState();
}

class _DifficultySelectionState extends State<DifficultySelection> {
  void displayResetDialog(BuildContext context) {
    Widget cancelButton = TextButton(
        onPressed: () {
          Navigator.of(context, rootNavigator: true).pop('dialog');
        },
        child: Text("取消", style: TextStyle(color: Colors.grey)));

    Widget okButton = TextButton(
        onPressed: () {
          Player player = new Player();
          player.clearStorage();

          Navigator.pushNamedAndRemoveUntil(context, '/Home', (e) => false);
        },
        child: Text("确定",
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)));

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("是否要重置游戏？"),
      content: Text("你会失去目前的金币和游戏进展。"),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("选择游戏进度"),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: <Color>[
              Colors.orange.shade700,
              Colors.orange.shade600,
              Colors.orange.shade500,
              Colors.orange.shade400
            ])),
          ),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  displayResetDialog(context);
                },
                icon: Icon(Icons.restart_alt))
          ],
          elevation: 0,
        ),
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/background/second_bg.jpeg'),
                    fit: BoxFit.cover)),
            child: Column(
              children: <Widget>[
//                DifficultySelectionHeader(),
                DifficultySelectionBody(),
              ],
            ),
          ),
        ));
  }
}
