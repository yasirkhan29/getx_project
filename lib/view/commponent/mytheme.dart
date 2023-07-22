import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static Color loginbuttonColor = Colors.purple;
  static Color signupbuttonColor = Colors.grey;
  static Color loginpageBoxColor = Color(0xffccccff);

  static ThemeData lightTheme(BuildContext context) => ThemeData(
      canvasColor: Colors.white,
      fontFamily: GoogleFonts.poppins().fontFamily,
      colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Colors.black,
          onPrimary: Colors.black,
          secondary: Colors.black,
          onSecondary: Colors.black,
          error: Colors.black,
          onError: Colors.black,
          background: Colors.black,
          onBackground: Colors.black,
          surface: Colors.black,
          onSurface: Colors.black));

  static ThemeData darkThem(BuildContext context) => ThemeData(
      canvasColor: Colors.black,
      fontFamily: GoogleFonts.poppins().fontFamily,
      colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: Colors.white,
          onPrimary: Colors.white,
          secondary: Colors.white,
          onSecondary: Colors.white,
          error: Colors.white,
          onError: Colors.white,
          background: Colors.white,
          onBackground: Colors.white,
          surface: Colors.white,
          onSurface: Colors.white));
}
