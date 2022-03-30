import 'package:flutter/material.dart';

class CustomTheme{

  static ThemeData lightTheme=ThemeData(
    primarySwatch: Colors.indigo,
    scaffoldBackgroundColor: Colors.grey.shade300,
    listTileTheme: const ListTileThemeData(tileColor: Colors.white)
  );

    static ThemeData darkTheme=ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.grey.shade700,
    textTheme: const TextTheme(bodyText1: TextStyle(color: Colors.white) ),
    scaffoldBackgroundColor: Colors.grey.shade800,
    appBarTheme: AppBarTheme( foregroundColor: Colors.white, backgroundColor: Colors.grey[600]),
    iconTheme: const  IconThemeData(color: Colors.white),
    cardTheme: CardTheme(color: Colors.grey[700]),
    listTileTheme: ListTileThemeData(
      tileColor: Colors.grey[700],
      iconColor: Colors.white,
      textColor: Colors.white),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.grey[700],
      foregroundColor: Colors.white)
    
    
  );

}