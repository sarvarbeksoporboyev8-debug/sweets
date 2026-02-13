import 'package:flutter/material.dart';
import '../constants/colors.dart';

/// Design tokens and theme configuration for the Sweets app
/// Colors are now imported from lib/constants/colors.dart

ThemeData buildSweetsTheme() {
  const baseTextColor = SweetsColors.kDarkText;

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
    brightness: Brightness.light,
    
    // Main colors - creamy background
    scaffoldBackgroundColor: SweetsColors.kCreamBg, // #F6EFE3
    primaryColor: SweetsColors.kAccentGold, // #D1B57C
    
    // AppBar styling - PURE WHITE
    appBarTheme: const AppBarTheme(
      backgroundColor: SweetsColors.kTopBar, // Pure white #FFFFFF
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      iconTheme: IconThemeData(color: SweetsColors.kDarkText),
      titleTextStyle: TextStyle(
        color: SweetsColors.kDarkText,
        fontWeight: FontWeight.w700,
        fontSize: 18,
        fontFamily: 'Geist',
      ),
    ),
    
    // Color scheme
    colorScheme: const ColorScheme.light(
      primary: SweetsColors.kAccentGold, // Gold accent
      secondary: SweetsColors.kAccentGold,
      surface: SweetsColors.kCardWhite, // White cards
      background: SweetsColors.kCreamBg, // Creamy background
      onBackground: SweetsColors.kDarkText,
      error: Color(0xFFDC2626),
    ),
    
    // Card theme - white with shadow
    cardTheme: CardThemeData(
      color: SweetsColors.kCardWhite,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      shadowColor: SweetsColors.kCardShadow,
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
      fillColor: SweetsColors.white, // Keep inputs white for better contrast
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
          color: SweetsColors.kAccentGold, // #D1B57C
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
        backgroundColor: SweetsColors.kAccentGold, // #D1B57C
        foregroundColor: SweetsColors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        textStyle: buttonLarge,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: SweetsColors.kAccentGold, // #D1B57C
      ),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: SweetsColors.kAccentGold, // #D1B57C
    ),
  );
}

