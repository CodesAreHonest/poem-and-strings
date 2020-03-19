import 'package:flutter/material.dart';

class SuccessFooter extends StatelessWidget {
  const SuccessFooter({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: RaisedButton.icon(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/DifficultySelection', (e) => false);
            },
            color: Colors.green[500],
            icon: Icon(Icons.thumb_up, size: 12, color: Colors.white),
            label: Text('完成', style: TextStyle(color: Colors.white))),
      ),
    );
  }
}
