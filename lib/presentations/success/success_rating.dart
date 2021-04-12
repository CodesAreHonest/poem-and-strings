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
    return Container(
        decoration: BoxDecoration(color: Colors.transparent),
        child: StageRating(value: goldObtained, size: 40));
  }
}
