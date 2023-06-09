import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppThemeConfig {
  static const String faFontFamilyName = 'IranYekan';
  final Color primaryColor = Colors.pink.shade400;
  final Color primaryTextColor;
  final Color secondaryTextColor;
  final Color surfaceColor;
  final Color backgroundColor;
  final Color appBarColor;
  final Brightness brightness;

  MyAppThemeConfig.light()
      : primaryTextColor = Colors.grey.shade900,
        secondaryTextColor = Colors.grey.shade900.withOpacity(0.8),
        surfaceColor = const Color(0x0d000000),
        backgroundColor = Colors.white,
        appBarColor = const Color.fromARGB(255, 235, 235, 235),
        brightness = Brightness.light;

  MyAppThemeConfig.dark()
      : primaryTextColor = Colors.white,
        secondaryTextColor = Colors.white70,
        surfaceColor = const Color(0x0dffffff),
        backgroundColor = const Color.fromARGB(255, 30, 30, 30),
        appBarColor = Colors.black,
        brightness = Brightness.dark;

  ThemeData getTheme(String languageCode) {
    return ThemeData(
        brightness: brightness,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: backgroundColor,
        dividerColor: surfaceColor,
        appBarTheme: AppBarTheme(
            backgroundColor: appBarColor, foregroundColor: primaryTextColor),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle:
              const TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none),
          filled: true,
          fillColor: surfaceColor,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(primaryColor),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8))))),
        textTheme:
            languageCode == 'fa' ? faPrimaryTextThem : enPrimaryTextTheme);
  }

  TextTheme get enPrimaryTextTheme => GoogleFonts.latoTextTheme(
        TextTheme(
            headline6:
                TextStyle(fontWeight: FontWeight.bold, color: primaryTextColor),
            bodyText2: TextStyle(fontSize: 14, color: primaryTextColor),
            bodyText1: TextStyle(fontSize: 13, color: secondaryTextColor),
            subtitle1: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 16,
                color: primaryTextColor)),
      );
  TextTheme get faPrimaryTextThem => TextTheme(
      headline6: TextStyle(
          fontWeight: FontWeight.bold,
          color: primaryTextColor,
          fontFamily: faFontFamilyName,
          fontSize: 18),
      caption: const TextStyle(fontFamily: faFontFamilyName),
      bodyText2: TextStyle(
          fontSize: 14, color: primaryTextColor, fontFamily: faFontFamilyName),
      bodyText1: TextStyle(
          fontSize: 13,
          color: secondaryTextColor,
          fontFamily: faFontFamilyName,
          height: 1.5),
      subtitle1: TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 15,
          color: primaryTextColor,
          fontFamily: faFontFamilyName),
      button: const TextStyle(fontFamily: faFontFamilyName));
}
