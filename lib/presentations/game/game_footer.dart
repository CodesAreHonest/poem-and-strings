import "package:flutter/material.dart";
import 'package:flutter/widgets.dart';
import 'package:poem_and_strings/models/models.dart';
import 'package:poem_and_strings/presentations/game/widgets/BackToHomeDialog.dart';
import 'package:poem_and_strings/presentations/game/widgets/RestartGameDialog.dart';
import 'package:poem_and_strings/presentations/game/widgets/ShowTipsDialog.dart';

class GameFooter extends StatefulWidget {
  final Function onRefreshStage;
  final Function onEnableDescription;
  final bool enableDescription;
  final Player player = Player();

  GameFooter(
      {required this.onRefreshStage,
      required this.onEnableDescription,
      required this.enableDescription});

  @override
  _GameFooterState createState() => _GameFooterState();
}

class _GameFooterState extends State<GameFooter> {
  int coin = 0;

  @override
  void initState() {
    getCurrentCoin();
    super.initState();
  }

  @override
  void didUpdateWidget(GameFooter oldWidget) {
    if (oldWidget.enableDescription != widget.enableDescription) {
      getCurrentCoin();
    }
    super.didUpdateWidget(oldWidget);
  }

  void getCurrentCoin() async {
    int coinBalance = await widget.player.getCoinBalance();
    setState(() {
      coin = coinBalance;
    });
  }

  displayLeaveGameDialog(BuildContext context) {
    // show the dialog
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) =>
          WillPopScope(onWillPop: () async => false, child: BackToHomeDialog()),
    );
  }

  displayRestartGameDialog(BuildContext context) {
    // show the dialog
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => WillPopScope(
          onWillPop: () async => false,
          child: RestartGameDialog(onRefreshStage: widget.onRefreshStage)),
    );
  }

  displayUseTipsDialog(BuildContext context) {
    // show the dialog
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => WillPopScope(
          onWillPop: () async => false,
          child: ShowTipsDialog(
            onEnableDescription: widget.onEnableDescription,
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                RawMaterialButton(
                    onPressed: () {
                      displayLeaveGameDialog(context);
                    },
                    child: Icon(Icons.home, color: Colors.white, size: 32.0),
                    shape: CircleBorder(),
                    elevation: 2.0,
                    fillColor: Colors.red[400],
                    padding: EdgeInsets.all(8.0)),
                SizedBox(height: 5.0),
                Text('主页',
                    style: TextStyle(
                        color: Colors.red[600], fontWeight: FontWeight.bold))
              ],
            ),
            Column(
              children: <Widget>[
                RawMaterialButton(
                    onPressed: () {
                      displayRestartGameDialog(context);
                    },
                    child: Icon(Icons.refresh, color: Colors.white, size: 32.0),
                    shape: CircleBorder(),
                    elevation: 2.0,
                    fillColor: Colors.lightBlue[700],
                    padding: EdgeInsets.all(8.0)),
                SizedBox(height: 5.0),
                Text('重新',
                    style: TextStyle(
                        color: Colors.lightBlue[700],
                        fontWeight: FontWeight.bold))
              ],
            ),
            Visibility(
              visible: !widget.enableDescription && coin >= 5,
              child: Column(
                children: <Widget>[
                  RawMaterialButton(
                      onPressed: () {
                        displayUseTipsDialog(context);
                      },
                      child: Icon(Icons.lightbulb_outline,
                          color: Colors.white, size: 32.0),
                      shape: CircleBorder(),
                      elevation: 2.0,
                      fillColor: Colors.green[400],
                      padding: EdgeInsets.all(8.0)),
                  SizedBox(height: 5.0),
                  Text('提示',
                      style: TextStyle(
                          color: Colors.green[400],
                          fontWeight: FontWeight.bold))
                ],
              ),
            ),
          ],
        ));
  }
}
