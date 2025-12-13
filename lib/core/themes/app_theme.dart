// lib/core/theme/app_theme.dart
import 'package:flutter/material.dart';

class AppTheme {
  // ============== DESIGN TOKENS ==============

  // Main brand colors (from Winter Chill palette)
  static const Color primary = Color(0xFF0B2E33); // deep teal
  static const Color primaryVariant = Color(0xFF4F7C82); // muted teal
  static const Color accent = Color(0xFFB8E3E9); // light icy blue

  static const Color backgroundLight = Color(0xFFF7FBFD); // soft almost-white
  static const Color backgroundLightBottom = Color(0xFFE4F3F6);

  // Cards / inputs (light)
  static const Color cardBgLight = Color(0xFFFFFFFF);

  // Disabled
  static const Color disabled = Color(0xFF93B1B5);

  // Text colors (light)
  static const Color textMainLight = Color(0xFF173A40);
  static const Color textSecondaryLight = Color(0xFF4F7C82);
  static const Color textPlaceholderLight = Color(0xFF93B1B5);

  // Errors
  static const Color errorColor = Color(0xFFD95C5C);
  static const Color errorBorderColor = Color(0xFFD95C5C);

  // Borders & dividers (light)
  static const Color inputBorderLight = Color(0xFF93B1B5);
  static const Color dividerLight = Color(0xFFDCE7EB);

  // ---------- DARK PALETTE ----------

  static const Color backgroundDarkTop = Color(0xFF0B2E33);
  static const Color backgroundDarkBottom = Color(0xFF07191C); // deeper bottom

  // Surfaces / cards on dark
  static const Color cardBgDark = Color(0xFF102B31); // for cards/panels
  static const Color surfaceAltDark = Color(0xFF0E3A42); // optional secondary surface

  // Inputs on dark: keep them light icy (like your screenshots)
  static const Color inputFillDark = accent; // 0xFFB8E3E9

  static const Color textMainDark = Color(0xFFF7FBFD);
  static const Color textSecondaryDark = Color(0xFF93B1B5);
  static const Color textPlaceholderDark = Color(0xFF4F7C82);

  static const Color inputBorderDark = Color(0xFF93B1B5);
  static const Color dividerDark = Color(0xFF24454B);

  // Common
  static const double fieldRadiusValue = 16;
  static final BorderRadius fieldRadius =
      BorderRadius.circular(fieldRadiusValue);

  // ============== BACKGROUND GRADIENTS ==============

  static const LinearGradient lightBackgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      backgroundLight,
      backgroundLightBottom,
    ],
  );

  static const LinearGradient darkBackgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      backgroundDarkTop,
      backgroundDarkBottom,
    ],
  );

  // ============== INPUT THEMES ==============

  static final InputDecorationTheme lightInputDecorationTheme =
      InputDecorationTheme(
    filled: true,
    fillColor: cardBgLight,
    hintStyle: const TextStyle(color: textPlaceholderLight),
    labelStyle: const TextStyle(color: textSecondaryLight),
    errorStyle: const TextStyle(
      color: errorColor,
      fontSize: 12,
      height: 1.2,
    ),
    border: OutlineInputBorder(
      borderRadius: fieldRadius,
      borderSide: const BorderSide(
        color: inputBorderLight,
        width: 1.5,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: fieldRadius,
      borderSide: const BorderSide(
        color: inputBorderLight,
        width: 1.5,
      ),
    ),
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(fieldRadiusValue)),
      borderSide: BorderSide(
        color: primary,
        width: 1.5,
      ),
    ),
    errorBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(fieldRadiusValue)),
      borderSide: BorderSide(
        color: errorBorderColor,
        width: 1.5,
      ),
    ),
    focusedErrorBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(fieldRadiusValue)),
      borderSide: BorderSide(
        color: errorBorderColor,
        width: 1.5,
      ),
    ),
    contentPadding:
        const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
  );

  static final InputDecorationTheme darkInputDecorationTheme =
      InputDecorationTheme(
    filled: true,
    fillColor: inputFillDark, // light cyan inputs on dark bg
    hintStyle: const TextStyle(color: textPlaceholderDark),
    labelStyle: const TextStyle(color: textSecondaryDark),
    floatingLabelStyle: const TextStyle(color: textMainDark),
    errorStyle: const TextStyle(
      color: errorColor,
      fontSize: 12,
      height: 1.2,
    ),
    border: OutlineInputBorder(
      borderRadius: fieldRadius,
      borderSide: const BorderSide(
        color: inputBorderDark,
        width: 1.5,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: fieldRadius,
      borderSide: const BorderSide(
        color: inputBorderDark,
        width: 1.5,
      ),
    ),
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(fieldRadiusValue)),
      borderSide: BorderSide(
        color: Colors.white,
        width: 1.5,
      ),
    ),
    errorBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(fieldRadiusValue)),
      borderSide: BorderSide(
        color: errorBorderColor,
        width: 1.5,
      ),
    ),
    focusedErrorBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(fieldRadiusValue)),
      borderSide: BorderSide(
        color: errorBorderColor,
        width: 1.5,
      ),
    ),
    contentPadding:
        const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
  );

  // ============== BUTTON THEMES ==============

  static final ElevatedButtonThemeData elevatedButtonTheme =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: primary,
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      textStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      overlayColor: const Color(0xFF082026), // pressed state
    ),
  );

  static final TextButtonThemeData lightTextButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: primary,
      textStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    ),
  );

  static final TextButtonThemeData darkTextButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: textSecondaryDark,
      textStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    ),
  );

  // ============== THEMES ==============

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor:
        Colors.transparent, // gradient is painted in pages
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: primary,
      onPrimary: Colors.white,
      secondary: accent,
      onSecondary: textMainLight,
      error: errorColor,
      onError: Colors.white,
      background: backgroundLight,
      onBackground: textMainLight,
      surface: cardBgLight,
      onSurface: textMainLight,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: textMainLight,
        fontSize: 14,
      ),
      titleLarge: TextStyle(
        color: textMainLight,
        fontSize: 28,
        fontWeight: FontWeight.w700,
      ),
      titleMedium: TextStyle(
        color: textSecondaryLight,
        fontSize: 16,
      ),
    ),
    inputDecorationTheme: lightInputDecorationTheme,
    elevatedButtonTheme: elevatedButtonTheme,
    textButtonTheme: lightTextButtonTheme,
    dividerColor: dividerLight,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.transparent,
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: primary,
      onPrimary: Colors.white,
      secondary: accent,
      onSecondary: backgroundDarkTop,
      error: errorColor,
      onError: Colors.white,
      background: backgroundDarkTop,
      onBackground: textMainDark,
      surface: cardBgDark, // dark cards / panels
      onSurface: textMainDark,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: textMainDark,
        fontSize: 14,
      ),
      titleLarge: TextStyle(
        color: textMainDark,
        fontSize: 28,
        fontWeight: FontWeight.w700,
      ),
      titleMedium: TextStyle(
        color: textSecondaryDark,
        fontSize: 16,
      ),
    ),
    inputDecorationTheme: darkInputDecorationTheme,
    elevatedButtonTheme: elevatedButtonTheme,
    textButtonTheme: darkTextButtonTheme,
    dividerColor: dividerDark,
  );
}
