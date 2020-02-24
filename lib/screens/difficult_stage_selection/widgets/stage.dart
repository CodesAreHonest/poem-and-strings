import "package:flutter/material.dart";
import "./stage_rating.dart";

class Stage extends StatelessWidget {
  const Stage({
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
              backgroundColor: Colors.red[400],
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
