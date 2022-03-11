import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      fontFamily: GoogleFonts.inter().fontFamily,
      buttonTheme: const ButtonThemeData(
        buttonColor: Color(0xff515CC6),
      ),
      primaryColor: Colors.black,
      canvasColor: Colors.grey,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      scaffoldBackgroundColor: Colors.black,
      fontFamily: GoogleFonts.inter().fontFamily,
      buttonTheme: const ButtonThemeData(
        buttonColor: Color(0xff515CC6),
      ),
      primaryColor: Colors.white,
      canvasColor: Colors.white,

    );
  }
}
