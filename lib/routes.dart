import "package:flutter/material.dart";
import "screens/home/index.dart";

class Routes {
  final routes = <String, WidgetBuilder> {
    '/Home': (BuildContext context) => Home()
  };

  Routes() {
    runApp(MaterialApp(
      title: "Flutter Demo",
      routes: routes,
      home: Home()
    ));
  }
}