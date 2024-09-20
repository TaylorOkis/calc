import 'package:flutter/material.dart';

class Apptheme {
  final Color _primaryColor = const Color(0xff24661A);
  final Color _clearColor = const Color(0xffF00404);
  final Color _resultColor = const Color(0xff787F77);

  ThemeData lightMode() {
    return ThemeData(
      brightness: Brightness.light,
      textTheme: TextTheme(
        displayLarge: const TextStyle(
            fontSize: 36,
            color: Color(0xff000000),
            fontWeight: FontWeight.w700), // Display figures
        bodyLarge: const TextStyle(
            fontSize: 34,
            color: Color(0xff000000),
            fontWeight: FontWeight.w700), // keypad text
        bodyMedium: TextStyle(
            fontSize: 34,
            color: _primaryColor,
            fontWeight: FontWeight.w700), // symbols
        bodySmall: TextStyle(
            fontSize: 34,
            color: _clearColor,
            fontWeight: FontWeight.w700), // clear functions
        labelLarge: TextStyle(
            fontSize: 30,
            color: _resultColor,
            fontWeight: FontWeight.w700), // result
        labelMedium: TextStyle(
            fontSize: 30,
            color: _primaryColor,
            fontWeight: FontWeight.w700), // equal-to sign
      ),
      colorScheme: ColorScheme.light(
        surface: const Color(0xffFFFFFF),
        primary: _primaryColor,
        secondary: const Color(0xffD9D9D9), // button color
      ),
    );
  }

  ThemeData darkMode() {
    return ThemeData(
      brightness: Brightness.dark,
      textTheme: TextTheme(
        displayLarge: const TextStyle(
            fontSize: 36,
            color: Color(0xffFFFFFF),
            fontWeight: FontWeight.w700), // Display figures
        bodyLarge: const TextStyle(
            fontSize: 34,
            color: Color(0xffFFFFFF),
            fontWeight: FontWeight.w700), // keypad text
        bodyMedium: TextStyle(
            fontSize: 34,
            color: _primaryColor,
            fontWeight: FontWeight.w700), // symbols
        bodySmall: TextStyle(
            fontSize: 34,
            color: _clearColor,
            fontWeight: FontWeight.w700), // clear functions
        labelLarge: TextStyle(
            fontSize: 30,
            color: _resultColor,
            fontWeight: FontWeight.w700), // result
        labelMedium: TextStyle(
            fontSize: 30,
            color: _primaryColor,
            fontWeight: FontWeight.w700), // equal-to sign
      ),
      colorScheme: ColorScheme.dark(
        surface: const Color(0xff101010),
        primary: _primaryColor,
        secondary: const Color(0xff030303),
        tertiary: _clearColor,
      ),
    );
  }
}
