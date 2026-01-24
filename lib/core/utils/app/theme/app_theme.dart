import 'package:flutter/material.dart';
import 'package:movi_app/core/utils/app/styles/app_styles.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.blue,
        titleTextStyle: AppStyles.styleBold24,
      ),
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        primary: Colors.blue,
        secondary: Colors.blueAccent,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.grey[800],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
        hintStyle: AppStyles.styleRegular16.copyWith(color: Colors.grey[400]),
      ),
    );
  }
}
