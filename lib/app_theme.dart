import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.light,
        primary: Color(0xFF5D9CEC),
        secondary: Color(0xFFDFECDB),
        seedColor: const Color(0xFF5D9CEC)),
    useMaterial3: true,
  );

  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark, seedColor: Colors.deepPurple),
    useMaterial3: true,
  );
}
