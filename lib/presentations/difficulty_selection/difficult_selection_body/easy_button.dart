import "package:flutter/material.dart";

class EasyButton extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<EasyButton> {
  Future navigateToSubPage(context) async {
    Navigator.pushNamed(context, '/EasyStageSelection');
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        onPressed: () {
          navigateToSubPage(context);
        },
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        textColor: Colors.white,
        padding: EdgeInsets.all(0.0),
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      Colors.green[800],
                      Colors.green[700],
                      Colors.green[600],
                      Colors.green[500],
                    ])),
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("简单", style: TextStyle(fontSize: 32)),
                  SizedBox(height: 8.0),
//                  Text("1/10", style: TextStyle(fontSize: 16, color: Colors.white70))
                ])));
  }
}
