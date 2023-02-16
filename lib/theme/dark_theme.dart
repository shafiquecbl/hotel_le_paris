import 'package:flutter/material.dart';

ThemeData dark({Color color = const Color(0xFF3D61A7)}) => ThemeData(
      useMaterial3: true,
      fontFamily: 'Movie',
      primaryColor: color,
      secondaryHeaderColor: const Color(0xFF009f67),
      disabledColor: const Color(0xffa2a7ad),
      backgroundColor: const Color(0xFF1A1D1F),
      scaffoldBackgroundColor: const Color(0xFF272B30),
      errorColor: const Color(0xFFdd3135),
      brightness: Brightness.dark,
      hintColor: const Color(0xFFbebebe),
      cardColor: const Color(0xFF272B30),
      colorScheme: ColorScheme.dark(primary: color, secondary: color),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: color)),
    );
