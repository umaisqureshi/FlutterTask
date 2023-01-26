import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemeValues {
  static ThemeData get lightTheme => ThemeData(
        primaryColor: const Color.fromARGB(255, 248, 246, 246),
        appBarTheme: AppBarTheme(
            backgroundColor: const Color.fromARGB(255, 208, 207, 207),
            centerTitle: true,
            elevation: 0,
            titleTextStyle:
                GoogleFonts.aBeeZee(color: Colors.teal, fontSize: 25)),
        backgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.teal)
            .copyWith(onBackground: Colors.black, brightness: Brightness.light),
      );

  static ThemeData get darkTheme => ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color.fromARGB(255, 30, 29, 29),
        appBarTheme: AppBarTheme(
            backgroundColor: const Color.fromARGB(255, 15, 15, 15),
            centerTitle: true,
            elevation: 0,
            titleTextStyle:
                GoogleFonts.aBeeZee(color: Colors.teal, fontSize: 25)),
        backgroundColor: Colors.black26,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.teal)
            .copyWith(onBackground: Colors.white, brightness: Brightness.dark),
      );
}
