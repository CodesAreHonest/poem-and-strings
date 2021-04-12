import 'package:flutter/material.dart';

class SuccessCoinAmount extends StatelessWidget {
  const SuccessCoinAmount({
    Key key,
    @required this.goldObtained,
  }) : super(key: key);

  final int goldObtained;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: <Widget>[
        Image.asset('assets/stack-of-coins.png', width: 80, height: 80),
        Text('x $goldObtained',
            style: TextStyle(
                fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold))
      ],
    ));
  }
}
