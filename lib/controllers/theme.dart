import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  final lightTheme = ThemeData.light().copyWith(
    primaryColor: Colors.blueGrey[300],
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      iconTheme: const IconThemeData(
        color: Color(0xff21262D),
      ),
      color: Colors.white,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: GoogleFonts.roboto(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: const Color(0xff21262D),
      ),
    ),
  );

  final darkTheme = ThemeData.dark().copyWith(
    iconTheme: IconThemeData(color: Colors.white),
    primaryColor: Colors.blueGrey[300],
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xff21262D),
    appBarTheme: AppBarTheme(
      color: const Color(0xff21262D),
      elevation: 0,
      centerTitle: true,
      titleTextStyle: GoogleFonts.roboto(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    ),
  );
}
