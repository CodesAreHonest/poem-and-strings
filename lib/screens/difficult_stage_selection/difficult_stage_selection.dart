import 'package:flutter/material.dart';
import 'package:poem_and_strings/screens/difficult_stage_selection/widgets/star_display.dart';
import "widgets/appbar.dart";

class DifficultStageSelection extends StatelessWidget {

  final titles = ['诗经 • 关唯', 'test', 'test', 'test',
    'test'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DifficultStageAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: ListView.builder(
          itemCount: titles.length,
          itemBuilder: (context, index) {

            int steps = index + 1;

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
                    title: Text(titles[index]),
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
          },
        ),
      ),
    );
  }
}
