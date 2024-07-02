import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    primaryColor: Colors.orange,
    colorScheme: const ColorScheme.dark(
      primary: Colors.orange,
      secondary: Colors.orange,
    ),
  );
}
