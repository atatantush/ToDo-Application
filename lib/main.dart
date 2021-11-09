import 'package:flutter/material.dart';
import 'package:to_do_application/My_Theme_Data.dart';
import 'package:to_do_application/UI/Home/HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: MyThemeData.lightTheme,
      routes: {
        HomeScreen.routeName: (buildContext) => HomeScreen(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}
