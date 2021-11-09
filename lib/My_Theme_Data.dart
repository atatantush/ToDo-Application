import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyThemeData {
  static const Color lightScaffoldBackground =
      Color.fromRGBO(223, 236, 219, 1.0);

  static final ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: lightScaffoldBackground,
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 32,
        color: Colors.black,
      ),
      headline2: TextStyle(
        fontSize: 25,
        color: Colors.blue,
        fontWeight: FontWeight.bold,
      ),
      subtitle1: TextStyle(
        fontSize: 18,
        color: Colors.black,
      ),
      subtitle2: TextStyle(
        fontSize: 16,
        color: Colors.black45,
      ),
    ),
  );
}
