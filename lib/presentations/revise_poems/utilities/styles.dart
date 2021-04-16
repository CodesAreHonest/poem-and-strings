import 'package:flutter/material.dart';

class TitleStyleContainer extends StatelessWidget {
  final String title;

  TitleStyleContainer({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Center(
          child: Text(this.title,
              style: TextStyle(
                  color: Colors.blue[800],
                  fontSize: 24,
                  fontWeight: FontWeight.w600)),
        ));
  }
}

class PoemStyleContainer extends StatelessWidget {
  final String poems;

  PoemStyleContainer({required this.poems});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Center(
        child: Text(poems,
            style: TextStyle(
                fontSize: 22,
                letterSpacing: 1.8,
                color: Colors.black87,
                fontWeight: FontWeight.w500)),
      ),
    );
  }
}

final kTitleStyle = TextStyle(
  color: Colors.white,
  fontSize: 26.0,
  height: 1.5,
);

final kSubtitleStyle = TextStyle(
  color: Colors.white,
  fontSize: 18.0,
  height: 1.2,
);
