import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:poem_and_strings/data/ArcKeys.dart';
import 'package:poem_and_strings/presentations/revise_poems/first_poem.dart';
import 'package:poem_and_strings/presentations/revise_poems/second_poem.dart';
import 'package:poem_and_strings/presentations/revise_poems/third_poem.dart';
import 'package:poem_and_strings/presentations/revise_poems/widgets/page_indicator.dart';

class RevisePoems extends StatefulWidget {
  @override
  _RevisePoemsScreenState createState() => _RevisePoemsScreenState();
}

class _RevisePoemsScreenState extends State<RevisePoems> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.4, 0.7, 0.9],
              colors: [
                Colors.blue[500],
                Colors.blue[600],
                Colors.blue[700],
                Colors.blue[800],
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  height: 600,
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      FirstPoem(),
                      SecondPoem(),
                      ThirdPoem(),
                    ],
                  ),
                ),
                PageIndicator(currentPage: _currentPage),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
