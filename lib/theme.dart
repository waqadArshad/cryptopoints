import 'package:cryptopoints/constants/constant_variables.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//
ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: whiteColor,
    primarySwatch: Colors.grey,
    appBarTheme: const AppBarTheme(backgroundColor: whiteColor, elevation: 0, ),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 18,
        color: blackColor,
        fontWeight: FontWeight.normal,
        fontFamily: GoogleFonts.openSans().fontFamily,
      ),
      headline2: TextStyle(
        fontSize: 14,
        color: blackColor,
        fontWeight: FontWeight.normal,
        fontFamily: GoogleFonts.openSans().fontFamily,
      ),
      // bodyText1: TextStyle()
    ),
    fontFamily: GoogleFonts.openSans().fontFamily,
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(fontSize: 14, color: greyColor, fontFamily: GoogleFonts.openSans().fontFamily),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        borderSide: BorderSide(
          color: yellowColor,
          width: 1.0,
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        borderSide: BorderSide(
          color: yellowColor,
          width: 1.0,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        borderSide: BorderSide(
          color: redColor,
          width: 1.0,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(
          color: redColor,
          width: 1.0,
        ),
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.black,
    ),

);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.red,
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: whiteColor,
  ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: TextStyle(fontSize: 14, color: greyColor, fontFamily: GoogleFonts.openSans().fontFamily),
    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
    enabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      borderSide: BorderSide(
        color: yellowColor,
        width: 1.0,
      ),
    ),
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      borderSide: BorderSide(
        color: yellowColor,
        width: 1.0,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(15)),
      borderSide: BorderSide(
        color: redColor,
        width: 1.0,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(
        color: redColor,
        width: 1.0,
      ),
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: Colors.red),
);
