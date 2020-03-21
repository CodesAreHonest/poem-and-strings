import 'package:flutter/material.dart';
import 'utilities/styles.dart';

class FirstPoem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Connect people\naround the world',
            style: kTitleStyle,
          ),
          SizedBox(height: 15.0),
          Text(
            'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
            style: kSubtitleStyle,
          ),
        ],
      ),
    );
  }
}
