import 'package:flutter/material.dart';

ThemeData darkTheme() => ThemeData(
      colorScheme: ColorScheme.dark(primary: Colors.black),
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(color: Colors.white12),
      scaffoldBackgroundColor: Colors.grey[700],
      iconTheme: IconThemeData(color: Colors.white),
      hintColor: Colors.orange,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.white70,
      ),
      textTheme: TextTheme(
        headline4: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        headline5: TextStyle(fontSize: 23, fontWeight: FontWeight.w200),
      ),
    );

ThemeData lightTheme() => ThemeData(
      primarySwatch: Colors.purple,
      colorScheme: ColorScheme.light(primary: Colors.purple),
      brightness: Brightness.light,
      appBarTheme: AppBarTheme(color: Colors.purple),
      scaffoldBackgroundColor: Colors.grey[100],
      iconTheme: IconThemeData(color: Colors.white),
      hintColor: Colors.orange,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.orange,
      ),
      textTheme: TextTheme(
        headline4: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        headline5: TextStyle(fontSize: 23, fontWeight: FontWeight.w200),
      ),
    );
