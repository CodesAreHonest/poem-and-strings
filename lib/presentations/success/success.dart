import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:poem_and_strings/widgets/stage_rating.dart';

class SuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
              decoration: BoxDecoration(color: Colors.grey[200]),
              child: Text('恭喜过关 ！',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 32, color: Colors.black)),
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 32.0),
                decoration: BoxDecoration(color: Colors.grey[100]),
                child: Text('恭喜完成第二关，你将获得',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.black))),
            Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(color: Colors.white24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('graphics/stack-of-coins.png',
                        width: 150, height: 150),
                    Text('x 3',
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                            fontWeight: FontWeight.bold))
                  ],
                )),
            Center(
              child: Container(
                  decoration: BoxDecoration(color: Colors.white30),
                  padding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: StageRating(value: 3, size: 45)),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
              decoration: BoxDecoration(color: Colors.grey[100]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                      onPressed: () {},
                      textColor: Colors.white,
                      child: Text('诗歌解释', style: TextStyle(fontSize: 16.0)),
                      color: Colors.blue[600],
                      padding: EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 16.0)),
                  RaisedButton(
                      onPressed: () {},
                      textColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 16.0),
                      color: Colors.red[700],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text('观赏影片', style: TextStyle(color: Colors.white)),
                          SizedBox(width: 8.0),
                          Icon(Icons.ondemand_video, color: Colors.white)
                        ],
                      ))
                ],
              ),
            ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Container(
                    padding:
                        EdgeInsets.only(left: 8.0, right: 8.0, bottom: 24.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          RaisedButton.icon(
                              onPressed: () {},
                              color: Colors.blue[500],
                              icon: Icon(Icons.arrow_back_ios,
                                  size: 12, color: Colors.white),
                              label: Text('返回',
                                  style: TextStyle(color: Colors.white))),
                          RaisedButton.icon(
                              onPressed: () {},
                              color: Colors.green[500],
                              icon: Icon(Icons.refresh,
                                  size: 16, color: Colors.white),
                              label: Text('重新',
                                  style: TextStyle(color: Colors.white))),
                          RaisedButton.icon(
                              onPressed: () {},
                              color: Colors.deepPurple[500],
                              icon: Icon(Icons.keyboard_arrow_right,
                                  size: 16, color: Colors.white),
                              label: Text('下一关',
                                  style: TextStyle(color: Colors.white))),
                        ])),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
