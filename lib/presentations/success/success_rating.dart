import 'package:flutter/material.dart';
import 'package:poem_and_strings/widgets/stage_rating.dart';

class SuccessRating extends StatelessWidget {
  const SuccessRating({
    Key key,
    @required this.goldObtained,
  }) : super(key: key);

  final int goldObtained;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          decoration: BoxDecoration(color: Colors.white),
          padding: EdgeInsets.all(8.0),
          child: StageRating(value: goldObtained, size: 45)),
    );
  }
}
