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
    return ElevatedButton(
        onPressed: () {
          navigateToSubPage(context);
        },
        style: ButtonStyle(
            textStyle:
                MaterialStateProperty.all(TextStyle(color: Colors.white)),
            padding: MaterialStateProperty.all(EdgeInsets.zero),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0)))),
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      Colors.green.shade800,
                      Colors.green.shade700,
                      Colors.green.shade600,
                      Colors.green.shade500,
                    ])),
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("简单", style: TextStyle(fontSize: 32)),
                  SizedBox(height: 8.0),
                ])));
  }
}
