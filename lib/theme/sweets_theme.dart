import 'package:flutter/material.dart';

/// Design tokens and theme configuration for the Sweets app
/// based on the provided Figma file.
class SweetsColors {
  static const primary = Color(0xFFFD7E14); // Primary-accent/Primary
  static const primaryLighter = Color(0xFFFFA94D); // Primary-accent/Primary Lighter
  static const primaryDark = Color(0xFFF76707); // Primary-accent/Primary Dark
  static const black = Color(0xFF000000); // Neutral/Black/100
  static const grayDarker = Color(0xFF343A40); // Neutral/Gray/Gray Darker
  static const grayDark = Color(0xFF495057); // Neutral/Gray/Gray Dark
  static const gray = Color(0xFF868E96); // Neutral/Gray/Gray
  static const grayLighter = Color(0xFFF1F3F5); // Neutral/Gray/Gray Lighter
  static const border = Color(0xFFDEE2E6); // Borders/100
  static const white = Color(0xFFFFFFFF); // Neutral/White/100
  static const white75 = Color(0xBFFFFFFF); // Neutral/White/75
  static const successDarker = Color(0xFF66A80F); // State/Success/Success Darker
  static const successBackground = Color(0x80A9E34B); // rgba(169,227,75,0.5)
  static const dangerDarker = Color(0xFFE03131); // State/Danger/Danger Darker
  static const dangerBackground = Color(0x80FF8787); // rgba(255,135,135,0.5)
}

ThemeData buildSweetsTheme() {
  const baseTextColor = SweetsColors.black;

  const headlineH1 = TextStyle(
    fontFamily: 'Geist',
    fontWeight: FontWeight.w600,
    fontSize: 32,
    height: 1.0, // 32px line height / 32px font size
    letterSpacing: -0.96, // -3 from Figma at 32px ≈ -0.96 in Flutter
    color: baseTextColor,
  );

  const labelExtraSmall = TextStyle(
    fontFamily: 'Geist',
    fontWeight: FontWeight.w400,
    fontSize: 12,
    height: 16 / 12,
    color: SweetsColors.grayDarker,
  );

  const bodySmall = TextStyle(
    fontFamily: 'Geist',
    fontWeight: FontWeight.w400,
    fontSize: 14,
    height: 20 / 14,
    color: SweetsColors.gray,
  );

  const bodyRegular = TextStyle(
    fontFamily: 'Geist',
    fontWeight: FontWeight.w400,
    fontSize: 16,
    height: 24 / 16,
    color: SweetsColors.grayDark,
  );

  const buttonLarge = TextStyle(
    fontFamily: 'Geist',
    fontWeight: FontWeight.w500,
    fontSize: 16,
    height: 24 / 16,
    letterSpacing: 0,
    color: SweetsColors.white,
  );

  return ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: SweetsColors.white,
    colorScheme: ColorScheme.fromSeed(
      seedColor: SweetsColors.primary,
      primary: SweetsColors.primary,
      secondary: SweetsColors.primary,
      surface: SweetsColors.white,
      brightness: Brightness.light,
    ),
    textTheme: const TextTheme(
      headlineLarge: headlineH1,
      bodyMedium: bodyRegular,
      bodySmall: bodySmall,
      labelLarge: buttonLarge,
      labelSmall: labelExtraSmall,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: SweetsColors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: SweetsColors.border,
          width: 1,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: SweetsColors.border,
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: SweetsColors.primary,
          width: 1.2,
        ),
      ),
      labelStyle: labelExtraSmall,
      hintStyle: bodySmall,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 14,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: SweetsColors.primary,
        foregroundColor: SweetsColors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        textStyle: buttonLarge,
      ),
    ),
  );
}

