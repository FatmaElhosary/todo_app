import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: Colors.white,
      colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.light,
          primary: const Color(0xFF5D9CEC),
          secondary: const Color(0xFFDFECDB),
          primaryContainer: const Color(0xFFFFFFFF),
          onBackground: const Color(0xFFFFFFFF),
          onPrimaryContainer: const Color(0xFF363636),
          outline: const Color(0xFF5D9CEC),
          //const Color(0xFF61E757)
          onErrorContainer: const Color(0xFFEC4B4B),
          seedColor: const Color.fromRGBO(33, 150, 243, 1)),
      useMaterial3: true,
      textTheme: const TextTheme(
          titleSmall: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
          titleMedium: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
            color: Color(0xFF303030),
          ),
          labelSmall: TextStyle(
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              color: Color(0xFF5D9CEC))),
      dropdownMenuTheme: const DropdownMenuThemeData(
        textStyle: TextStyle(
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            color: Color(0xFF5D9CEC)),
      ));

  static ThemeData darkTheme = ThemeData(
       primaryColor: Colors.white,
    colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark,
        primaryContainer: const Color(0xFF141922),
        secondary: const Color(0xFF060E1E),
        outline: const Color(0xFF5D9CEC),
        onPrimary: const Color(0xFF5D9CEC),
         onBackground: const Color(0xFFFFFFFF),
        seedColor: Colors.blue),
    useMaterial3: true,
    textTheme: const TextTheme(
      titleSmall: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        fontFamily: 'Poppins',
        //color: Color(0xFF060E1E),
      ),
      titleMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        fontFamily: 'Poppins',
        color: Color(0xFFFFFFFF),
      ),
      labelSmall: TextStyle(
          fontSize: 14,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
          color: Color(0xFF5D9CEC)),
    ),
  );
}
