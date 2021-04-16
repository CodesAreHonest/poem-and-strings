import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:poem_and_strings/presentations/difficult_guideline//first_guideline.dart';
import 'package:poem_and_strings/presentations/difficult_guideline/second_guideline.dart';
import 'package:poem_and_strings/presentations/difficult_guideline/third_guideline.dart';
import 'package:poem_and_strings/presentations/revise_poems/widgets/page_indicator.dart';

class DifficultGuideline extends StatefulWidget {
  @override
  _DifficultGuidelineState createState() => _DifficultGuidelineState();
}

class _DifficultGuidelineState extends State<DifficultGuideline> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

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
                  Colors.grey.shade600,
                  Colors.grey.shade500,
                  Colors.grey.shade400,
                  Colors.grey.shade300,
                ],
              )),
              child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      SizedBox(height: 50),
                      Container(
                        height: 550,
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
                          ],
                        ),
                      ),
                      SizedBox(height: 50),
                      PageIndicator(currentPage: _currentPage, numPages: 3),
                    ],
                  )),
            )),
      ),
    );
  }
}
