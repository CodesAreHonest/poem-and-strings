import "package:flutter/material.dart";

class EasyStageAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text("简单", style: TextStyle(color: Colors.white)),
      flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: <Color>[
        Colors.green.shade800,
        Colors.green.shade700,
        Colors.green.shade600,
        Colors.green.shade500,
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
