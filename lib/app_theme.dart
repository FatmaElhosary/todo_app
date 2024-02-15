import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.light,
        primary: const Color(0xFF5D9CEC),
        secondary: const Color(0xFFDFECDB),
        primaryContainer: const Color(0xFFFFFFFF),
        onPrimaryContainer: const Color(0xFF363636),
        outline: const Color(0xFF61E757),
        onErrorContainer: Color(0xFFEC4B4B),
        seedColor: const Color.fromRGBO(33, 150, 243, 1)),
    useMaterial3: true,
  );

  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark, seedColor: Colors.deepPurple),
    useMaterial3: true,
  );
}
