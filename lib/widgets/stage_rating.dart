import "package:flutter/material.dart";

class StarDisplay extends StatelessWidget {
  final int value;
  final Widget filledStar;
  final Widget unfilledStar;
  const StarDisplay({
    Key key,
    this.value = 0,
    @required this.filledStar,
    @required this.unfilledStar,
  })  : assert(value != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(3, (index) {
        return index < value ? filledStar : unfilledStar;
      }),
    );
  }
}

class StageRating extends StatelessWidget {
  final int value;
  const StageRating({this.value = 0}) : assert(value != null);

  @override
  Widget build(BuildContext context) {
    return IconTheme(
      data: IconThemeData(
        color: Colors.amber,
        size: 16,
      ),
      child: StarDisplay(
        value: value,
        filledStar: Icon(Icons.star),
        unfilledStar: Icon(Icons.star_border),
      ),
    );
  }
}
