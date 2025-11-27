import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Define strict palette: Blue and Black scales only.

  // Primary Blues
  static const Color primaryBlue = Color(0xFF003366); // Dark Blue (University style)
  static const Color accentBlue = Color(0xFF0056D2); // Brighter Blue for interactions
  static const Color lightBlue = Color(0xFFE6F0FF); // Very light blue for backgrounds

  // Blacks / Greys (using blue-tinted greys for consistency)
  static const Color black = Color(0xFF000000);
  static const Color darkGrey = Color(0xFF1A1A1A);
  static const Color mediumGrey = Color(0xFF4A4A4A);

  // Semantic Colors (Adapted to Blue/Black scale as requested)
  // Success: Using a teal/cyan blue
  static const Color success = Color(0xFF00897B);
  // Error: Using a very dark midnight blue or deep slate to distinguish,
  // since red is strictly forbidden. We'll use a high contrast dark color
  // distinct from primary, or potentially a 'negative' shade if strictly blue/black is enforced.
  // Given strict "only blue and black", I will use a distinct Dark Navy for error text on light backgrounds.
  static const Color error = Color(0xFF0D0D0D); // Almost black for error text

  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryBlue,
        primary: primaryBlue,
        secondary: accentBlue,
        surface: Colors.white,
        background: Colors.white,
        error: error,
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: Colors.white, // As requested: "Uso del fondo blanco"

      // Typography
      textTheme: GoogleFonts.robotoTextTheme().copyWith(
        displayLarge: const TextStyle(color: black, fontWeight: FontWeight.bold),
        displayMedium: const TextStyle(color: black, fontWeight: FontWeight.bold),
        bodyLarge: const TextStyle(color: darkGrey),
        bodyMedium: const TextStyle(color: mediumGrey),
      ),

      // Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryBlue,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),

      // Input Decoration
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: lightBlue,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: accentBlue, width: 2),
        ),
        hintStyle: const TextStyle(color: mediumGrey),
      ),

      // App Bar Theme
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: black,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: black),
      ),
    );
  }
}
