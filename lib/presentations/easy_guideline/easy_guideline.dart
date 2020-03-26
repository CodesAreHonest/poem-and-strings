import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:poem_and_strings/presentations/easy_guideline/first_guideline.dart';
import 'package:poem_and_strings/presentations/easy_guideline/fourth_guideline.dart';
import 'package:poem_and_strings/presentations/easy_guideline/second_guideline.dart';
import 'package:poem_and_strings/presentations/easy_guideline/third_guideline.dart';
import 'package:poem_and_strings/presentations/revise_poems/widgets/page_indicator.dart';

class EasyGuideLine extends StatefulWidget {
  @override
  _EasyGuideLineState createState() => _EasyGuideLineState();
}

class _EasyGuideLineState extends State<EasyGuideLine> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 4;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.dark,
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.1, 0.4, 0.7, 0.9],
                colors: [
                  Colors.grey[600],
                  Colors.grey[500],
                  Colors.grey[400],
                  Colors.grey[400],
                ],
              )),
              child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      SizedBox(height: 50),
                      Container(
                        height: 500,
                        child: PageView(
                          physics: ClampingScrollPhysics(),
                          controller: _pageController,
                          onPageChanged: (int page) {
                            setState(() {
                              _currentPage = page;
                            });
                          },
                          children: <Widget>[
                            FirstGuideline(),
                            SecondGuideline(),
                            ThirdGuideline(),
                            FourthGuideline(),
                          ],
                        ),
                      ),
                      SizedBox(height: 100),
                      PageIndicator(currentPage: _currentPage, numPages: 4),
                    ],
                  )),
            )),
      ),
    );
  }
}
