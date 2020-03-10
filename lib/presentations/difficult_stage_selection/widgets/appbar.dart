import 'package:flutter/material.dart';

class DifficultStageAppBar extends StatelessWidget implements PreferredSizeWidget {

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text("困难", style: TextStyle(color: Colors.white)),
      flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: <Color>[
                    Colors.red[800],
                    Colors.red[700],
                    Colors.red[600],
                    Colors.red[500],
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
