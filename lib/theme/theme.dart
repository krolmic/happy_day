import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:happy_day/daily_structures/daily_structures.dart';
import 'package:happy_day/edit_structure/edit_structure.dart';

class HappyDayTheme {
  static const primaryColor = Color(0xFF6a61f0);
  static Color primaryColorWithTransparency =
      primaryColor.withValues(alpha: 0.1);
  static Color primaryColorAlmostTransparent =
      primaryColor.withValues(alpha: 0.05);
  static const secondaryColor = Color(0xFF282828);
  static Color secondaryColorWithTransparency =
      secondaryColor.withValues(alpha: 0.3);
  static const backgroundColor = Colors.white;
  static const foregroundColorOnPrimary = Colors.white;

  static final borderRadius = BorderRadius.circular(10);

  static ThemeData get theme {
    return ThemeData(
      extensions: [
        DateTimeLineColors.light(),
        StructureWizardColors.light(),
      ],
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
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: primaryColorAlmostTransparent,
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

  static ThemeData get darkTheme {
    return ThemeData(
      extensions: [
        DateTimeLineColors.dark(),
        StructureWizardColors.dark(),
      ],
      brightness: Brightness.dark,
      textTheme: GoogleFonts.nokoraTextTheme(
        ThemeData.dark().textTheme,
      ),
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: primaryColor,
      ),
      scaffoldBackgroundColor: const Color(0xFF121212),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF121212),
        surfaceTintColor: Colors.transparent,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
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
