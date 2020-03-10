import "package:flutter/material.dart";

class GameTranslation extends StatelessWidget {
  final String translation;

  GameTranslation({@required this.translation});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.blue[200]),
      padding: EdgeInsets.all(16.0),
      width: MediaQuery.of(context).size.width,
      child: Container(
        width: 100,
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                child: Column(
              children: <Widget>[
                Text('[译文]',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white70,
                        fontSize: 16,
                        letterSpacing: 1.2)),
                SizedBox(height: 8.0),
                Text(this.translation,
                    style: TextStyle(
                        color: Colors.white, fontSize: 12, letterSpacing: 1.2))
              ],
            )),
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.blue[300],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.0),
                bottomRight: Radius.circular(8.0))),
      ),
    );
  }
}
