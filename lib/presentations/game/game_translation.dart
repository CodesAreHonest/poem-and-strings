import "package:flutter/material.dart";

class GameTranslation extends StatelessWidget {
  final String translation;
  final bool enableDescription;

  GameTranslation(
      {@required this.translation, @required this.enableDescription});

  Widget description(context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      padding: EdgeInsets.all(16.0),
      width: MediaQuery.of(context).size.width,
      child: Container(
        width: 100,
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[
                      Colors.grey[100],
                      Colors.grey[200],
                      Colors.grey[300],
                    ])),
                child: Column(
                  children: <Widget>[
                    Text('译文',
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: Colors.black,
                            fontSize: 20,
                            letterSpacing: 1.2)),
                    SizedBox(height: 12.0),
                    Text(this.translation,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            letterSpacing: 1.2))
                  ],
                )),
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.grey[300], borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  Widget blankDescription(context) {
    return Container(
        decoration: BoxDecoration(color: Colors.white70),
        padding: EdgeInsets.all(64.0),
        width: MediaQuery.of(context).size.width,
        child: Container());
  }

  @override
  Widget build(BuildContext context) {
    return this.enableDescription
        ? description(context)
        : blankDescription(context);
  }
}
