import 'package:flutter/material.dart';

class DifficultStageAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text("困难", style: TextStyle(color: Colors.white)),
      flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: <Color>[
        Colors.red.shade800,
        Colors.red.shade700,
        Colors.red.shade600,
        Colors.red.shade500,
      ]))),
      actions: <Widget>[
        Container(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
                child: Text("",
                    style: TextStyle(color: Colors.white, fontSize: 16.0))))
      ],
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(55.0);
}
