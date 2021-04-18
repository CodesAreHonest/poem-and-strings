import 'package:flutter/material.dart';
import 'package:poem_and_strings/widgets/stage_rating.dart';

class SuccessRating extends StatelessWidget {
  const SuccessRating({
    Key? key,
    required this.rating,
  }) : super(key: key);

  final int rating;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Colors.transparent),
        child: StageRating(value: this.rating, size: 40));
  }
}
