import 'package:flutter/material.dart';

class HappyDayTheme {
  static const primaryColor = Color(0xFF6a61f0);
  static Color primaryColorWithTransparency = primaryColor.withOpacity(0.1);
  static const secondaryColor = Color(0xFF282828);
  static Color secondaryColorWithTransparency = secondaryColor.withOpacity(0.3);

  static ThemeData get theme {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF6a61f0),
      ),
      appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(
          color: Color(0xFF282828),
          fontSize: 18,
        ),
        iconTheme: IconThemeData(
          color: Color(0xFF282828),
          size: 18,
        ),
      ),
      listTileTheme: ListTileThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        tileColor: primaryColorWithTransparency,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
      ),
      useMaterial3: true,
    );
  }
}