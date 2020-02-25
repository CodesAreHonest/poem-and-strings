import "package:flutter/material.dart";
import "package:poem_and_strings/widgets/stage_rating.dart";

class EasyStage extends StatelessWidget {
  const EasyStage({
    Key key,
    @required this.steps,
    @required this.titles,
  }) : super(key: key);

  final int steps;
  final String titles;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card( //
          elevation: 3.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green[400],
              child: Text(
                  "$steps",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400
                  )
              ),
            ),
            title: Text(titles),
            subtitle: StageRating(value: 1),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {},
            contentPadding: EdgeInsets.symmetric(
                horizontal: 16.0
            ),
          ),
        ),
        SizedBox(height: 8.0)
      ],
    );
  }
}
