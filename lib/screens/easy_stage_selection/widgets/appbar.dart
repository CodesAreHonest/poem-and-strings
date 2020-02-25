import "package:flutter/material.dart";

class EasyStageAppBar extends StatelessWidget implements PreferredSizeWidget {

  @override
  Widget build (BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text("简单", style: TextStyle(color: Colors.white)),
      flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: <Color>[
                    Colors.green[800],
                    Colors.green[700],
                    Colors.green[600],
                    Colors.green[500],
                  ]
              )
          )
      ),
      actions: <Widget>[
        Container(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
                child: Text(
                    "1/5",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0
                    )
                )
            )
        )
      ],
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(55.0);
}