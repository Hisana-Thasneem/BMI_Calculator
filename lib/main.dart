import 'package:bmi_calculator/calculations.dart';
import 'package:flutter/material.dart';
import 'content.dart';
import 'calculations.dart';
import "results.dart";

const inactiveCardcolor = Color(0xFFFFFFF);
const activeCardcolor = Color(0xFF000000);
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFFD52753),
        scaffoldBackgroundColor: Color(0xFF383E4E),
      ),
      home: Content(),

      // instead of hone we can use  initial routes  initialRoute: '/home',

      // create routes with values of context with class name of required pages.
      //where you wanted to navigate go there inside ontap/opressed  setstate navitor.pushname(context, name of class mapped string)
      //setState(() {
      //   Navigator.pushNamed(context, '/calculation');
      // });
      routes: {
        '/home': (context) => Content(),
        '/calculation': (context) => Calculations(),
      },
    );
  }
}
