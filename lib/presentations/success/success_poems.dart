import 'package:flutter/material.dart';

class SuccessPoems extends StatelessWidget {
  final String originalText;
  final String translation;

  SuccessPoems({@required this.originalText, @required this.translation});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        decoration: BoxDecoration(color: Colors.grey[200]),
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: Colors.white),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(this.originalText,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 8.0),
              Text(this.translation,
                  style: TextStyle(color: Colors.black54, fontSize: 12)),
            ],
          ),
        ));
  }
}
