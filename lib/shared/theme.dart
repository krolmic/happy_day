import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HappyDayTheme {
  static const primaryColor = Color(0xFF6a61f0);
  static Color primaryColorWithTransparency =
      primaryColor.withValues(alpha: 0.1);
  static const secondaryColor = Color(0xFF282828);
  static Color secondaryColorWithTransparency =
      secondaryColor.withValues(alpha: 0.3);
  static const backgroundColor = Colors.white;
  static const foregroundColorOnPrimary = Colors.white;

  static final borderRadius = BorderRadius.circular(10);

  static ThemeData get theme {
    return ThemeData(
      textTheme: GoogleFonts.nokoraTextTheme(
        const TextTheme(
          headlineMedium: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        surface: backgroundColor,
      ),
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: backgroundColor,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: TextStyle(
          color: secondaryColor,
          fontSize: 18,
        ),
        iconTheme: IconThemeData(
          color: secondaryColor,
          size: 18,
        ),
      ),
      listTileTheme: ListTileThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
        foregroundColor: foregroundColorOnPrimary,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: foregroundColorOnPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
        ),
      ),
      useMaterial3: true,
    );
  }
}
