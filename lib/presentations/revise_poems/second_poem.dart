import 'package:flutter/material.dart';
import 'utilities/styles.dart';

class SecondPoem extends StatelessWidget {
  const SecondPoem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Live your life smarter\nwith us!',
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
