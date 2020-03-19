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
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(color: Colors.white24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/stack-of-coins.png', width: 150, height: 150),
            Text('x $goldObtained',
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold))
          ],
        ));
  }
}
