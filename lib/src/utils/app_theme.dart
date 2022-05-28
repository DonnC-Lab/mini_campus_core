// global app theme
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_campus_core/mini_campus_core.dart';

class AppTheme {
  static TextTheme lightTextTheme = TextTheme(
    bodyText1: GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: McAppColors.appDarkModeFillColor,
    ),
    headline1: GoogleFonts.inter(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: McAppColors.appDarkModeFillColor,
    ),
    headline2: GoogleFonts.inter(
      fontSize: 21,
      fontWeight: FontWeight.w700,
      color: McAppColors.appDarkModeFillColor,
    ),
    headline3: GoogleFonts.inter(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: McAppColors.appDarkModeFillColor,
    ),
    headline6: GoogleFonts.inter(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: McAppColors.appDarkModeFillColor,
    ),
    button: GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: McAppColors.appMainColor,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    bodyText1: GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: McAppColors.appWhiteColor,
    ),
    headline1: GoogleFonts.inter(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: McAppColors.appWhiteColor,
    ),
    headline2: GoogleFonts.inter(
      fontSize: 21,
      fontWeight: FontWeight.w700,
      color: McAppColors.appWhiteColor,
    ),
    headline3: GoogleFonts.inter(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: McAppColors.appWhiteColor,
    ),
    headline6: GoogleFonts.inter(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: McAppColors.appWhiteColor,
    ),
    button: GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: McAppColors.appMainColor,
    ),
  );

  static ThemeData light() => ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: McAppColors.appBgColor,
        textTheme: lightTextTheme,
        primaryIconTheme:
            const IconThemeData(color: McAppColors.appGreyShadeColor),
        buttonTheme:
            const ButtonThemeData(buttonColor: McAppColors.appMainColor),
        appBarTheme: const AppBarTheme(color: McAppColors.appMainColor),
      );

  static ThemeData dark() => ThemeData(
        brightness: Brightness.dark,
        textTheme: darkTextTheme,
        scaffoldBackgroundColor: McAppColors.appDarkModeColor,
        primaryIconTheme:
            const IconThemeData(color: McAppColors.appGreyShadeColor),
        buttonTheme:
            const ButtonThemeData(buttonColor: McAppColors.appMainColor),
        appBarTheme: const AppBarTheme(color: McAppColors.appMainColor),
      );
}
