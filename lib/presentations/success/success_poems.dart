import 'package:flutter/material.dart';

class SuccessPoems extends StatelessWidget {
  final String originalText;
  final String translation;

  SuccessPoems({required this.originalText, required this.translation});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: Colors.white),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(this.originalText,
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.w600)),
              ),
              SizedBox(height: 8.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(this.translation,
                    style: TextStyle(color: Colors.black54, fontSize: 16)),
              ),
            ],
          ),
        ));
  }
}
