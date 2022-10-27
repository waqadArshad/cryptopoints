import 'package:flutter/material.dart';

//
ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.green,
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.red,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: Colors.red),
);
