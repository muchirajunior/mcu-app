import 'package:flutter/material.dart';

class CustomTheme{

  static ThemeData lightTheme=ThemeData(
    primarySwatch: Colors.indigo,
    scaffoldBackgroundColor: Colors.grey.shade300
  );

    static ThemeData darkTheme=ThemeData(
    primaryColor: Colors.grey.shade900,
    // textTheme: TextTheme(subtitle1: )
    scaffoldBackgroundColor: Colors.grey.shade800
  );

}