import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    primaryColor: Colors.green,
    primaryColorLight: Colors.green[200],
    backgroundColor: Colors.green[100],
    bottomAppBarColor: Colors.green[300],
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: Colors.white,
      backgroundColor: Colors.green,
    ),
    iconTheme: IconThemeData(color: Colors.white),
    cardTheme: CardTheme(
        color: Colors.white),
    highlightColor: Colors.white,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.blue

));

ThemeData darkTheme = ThemeData(
    primaryColor: Colors.black54,
    primaryColorLight: Colors.black26,
    backgroundColor: Colors.grey[400],
    bottomAppBarColor: Colors.black38,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        foregroundColor: Colors.grey[300],
        backgroundColor: Colors.black45),
    iconTheme: IconThemeData(color: Colors.grey[300]),
    cardTheme: CardTheme(
        color: Colors.grey[200]),
    highlightColor: Colors.grey[200],
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.grey[100])
);