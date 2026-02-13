import 'package:flutter/material.dart';
import '../constants/colors.dart';

/// Design tokens and theme configuration for the Sweets app
/// Colors are now imported from lib/constants/colors.dart

ThemeData buildSweetsTheme() {
  const baseTextColor = SweetsColors.textDark; // Updated to new text color
  const coralRed = SweetsColors.buttonCoral; // #FF7F6B

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
    color: SweetsColors.textOnCoral, // White text on coral buttons
  );

  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    
    // ===== SCAFFOLD & BACKGROUND =====
    scaffoldBackgroundColor: SweetsColors.pageBackground, // White #FFFFFF
    primaryColor: coralRed, // Coral/Red #FF7F6B
    
    // ===== APP BAR =====
    appBarTheme: const AppBarTheme(
      backgroundColor: SweetsColors.kTopBar, // Pure white #FFFFFF
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      iconTheme: IconThemeData(color: SweetsColors.textDark),
      titleTextStyle: TextStyle(
        color: SweetsColors.textDark,
        fontWeight: FontWeight.w700,
        fontSize: 18,
        fontFamily: 'Geist',
      ),
    ),
    
    // ===== COLOR SCHEME =====
    colorScheme: const ColorScheme.light(
      primary: coralRed,                    // Coral/Red for all primary elements
      secondary: coralRed,                  // Secondary actions
      tertiary: coralRed,
      surface: SweetsColors.white,          // Card surfaces
      background: SweetsColors.pageBackground, // Page background
      surfaceTint: Colors.transparent,
      onBackground: SweetsColors.textDark,
      error: Color(0xFFB3261E),
    ),
    
    // ===== CARD THEME =====
    cardTheme: const CardThemeData(
      color: SweetsColors.kCardWhite,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      shadowColor: SweetsColors.kCardShadow,
    ),
    
    // ===== TEXT THEMES =====
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: SweetsColors.textDark,
        fontWeight: FontWeight.w700,
        fontSize: 32,
        fontFamily: 'Geist',
      ),
      displayMedium: TextStyle(
        color: SweetsColors.textDark,
        fontWeight: FontWeight.w700,
        fontSize: 28,
        fontFamily: 'Geist',
      ),
      headlineLarge: headlineH1,
      headlineSmall: TextStyle(
        color: SweetsColors.textDark,
        fontWeight: FontWeight.w600,
        fontSize: 20,
        fontFamily: 'Geist',
      ),
      bodyLarge: TextStyle(
        color: SweetsColors.textDark,
        fontSize: 16,
        fontFamily: 'Geist',
      ),
      bodyMedium: bodyRegular,
      bodySmall: bodySmall,
      labelLarge: buttonLarge,
      labelSmall: labelExtraSmall,
    ),
    
    // ===== BUTTONS =====
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: coralRed,           // Coral/red buttons
        foregroundColor: SweetsColors.textOnCoral, // White text
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(24)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        textStyle: buttonLarge,
      ),
    ),
    
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: coralRed,
      ),
    ),
    
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: coralRed,
        side: const BorderSide(color: coralRed),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(24)),
        ),
      ),
    ),
    
    buttonTheme: const ButtonThemeData(
      buttonColor: coralRed,
    ),
    
    // ===== FLOATING ACTION BUTTON =====
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: coralRed,
      foregroundColor: SweetsColors.textOnCoral,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
    ),
    
    // ===== INPUT & FORM FIELDS =====
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: SweetsColors.white,
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide(
          color: SweetsColors.border,
          width: 1,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide(
          color: SweetsColors.border,
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide(
          color: coralRed, // Coral border when focused
          width: 2,
        ),
      ),
      labelStyle: labelExtraSmall,
      hintStyle: bodySmall,
    ),
    
    // ===== BOTTOM NAVIGATION =====
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: SweetsColors.white,
      selectedItemColor: coralRed,
      unselectedItemColor: Color(0xFFBDBDBD),
      elevation: 8,
    ),
    
    // ===== DIALOGS & SNACKBARS =====
    dialogBackgroundColor: SweetsColors.white,
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: Color(0xFF323232),
      contentTextStyle: TextStyle(color: SweetsColors.white),
    ),
  );
}

