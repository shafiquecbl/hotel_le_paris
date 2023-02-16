import 'package:flutter/material.dart';

ThemeData light({Color color = const Color(0xFF224E91)}) => ThemeData(
      useMaterial3: true,
      fontFamily: 'Movie',
      primaryColor: color,
      secondaryHeaderColor: const Color(0xFF1ED7AA),
      disabledColor: const Color(0xFFBABFC4),
      backgroundColor: const Color(0xFFFFFFFF),
      scaffoldBackgroundColor: const Color(0xFFFFFFFF),
      errorColor: const Color(0xFFE84D4F),
      brightness: Brightness.light,
      hintColor: const Color(0xFF9F9F9F),
      cardColor: const Color(0xFFF1F4F8),
      colorScheme: ColorScheme.light(primary: color, secondary: color),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: color)),
    );
