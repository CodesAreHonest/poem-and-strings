import 'package:flutter/material.dart';

class SuccessHeader extends StatelessWidget {
  const SuccessHeader({
    Key key,
  }) : super(key: key);

  Image redBannerImage() =>
      Image.asset('assets/red-banner.png', width: 100, height: 100);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
      decoration: BoxDecoration(color: Colors.white24),
      child: Container(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text('挑战成功',
              style: TextStyle(
                  color: Colors.amber,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.1)),
        )),
        height: 60,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/red-banner.png'), fit: BoxFit.fill)),
      ),
//      child: Text('恭喜过关 ！',
//          textAlign: TextAlign.center,
//          style: TextStyle(fontSize: 32, color: Colors.black)),
    );
  }
}
