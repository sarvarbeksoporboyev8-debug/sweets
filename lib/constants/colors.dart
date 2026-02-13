import 'package:flutter/material.dart';

/// Color constants for the Sweets app
/// 
/// Production theme colors:
/// - Top Bar: #FFFFFF (Pure white) - AppBar/header backgrounds
/// - Cream Background: #F6EFE3 (RGB 246, 239, 227) - Main screen backgrounds
/// - Card White: #FFFFFF (Pure white) - Card surfaces
/// - Primary Accent: #D1B57C (RGB 209, 181, 124) - Primary buttons and key accents
class SweetsColors {
  // Production theme colors
  static const Color kTopBar = Color(0xFFFFFFFF); // Pure white #FFFFFF
  static const Color kCreamBg = Color(0xFFF6EFE3); // Creamy background #F6EFE3
  static const Color kCardWhite = Color(0xFFFFFFFF); // Card surfaces
  static const Color kCardShadow = Color(0x1A000000); // Subtle shadow
  static const Color kAccentGold = Color(0xFFD1B57C); // Primary accent
  static const Color kDarkText = Color(0xFF1F2937); // Dark text
  static const Color kLightText = Color(0xFF6B7280); // Light text

  // Legacy custom theme colors (kept for backward compatibility)
  static const Color background = Color(0xFFF6EFE3); // Updated to creamy
  static const Color primary = Color(0xFFD1B57C); // RGB(209, 181, 124)
  static const Color primaryAccent = Color(0xFFD1B57C); // Alias for consistency

  // Legacy primary colors (kept for backward compatibility)
  static const Color primaryOrange = Color(0xFFFD7E14); // Legacy primary
  static const Color primaryLighter = Color(0xFFFFA94D); // Legacy primary lighter
  static const Color primaryDark = Color(0xFFF76707); // Legacy primary dark

  // Beige card gradient colors
  static const Color kCardBeige1 = Color(0xFFF3E6CF); // Light cream
  static const Color kCardBeige2 = Color(0xFFE6D1AD); // Warm beige
  static const Color kCardBeige3 = Color(0xFFD9BE8E); // Deeper beige (for depth variation)

  // Text colors for beige cards - ensure high contrast
  static const Color kCardTextDark = Color(0xFF2B1E16); // Dark brown
  static const Color kCardTextMedium = Color(0xFF5C4033); // Medium brown
  static const Color kCardTextLight = Color(0xFF8B7355); // Light brown

  // Neutral colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color gray = Color(0xFF868E96);
  static const Color grayDarker = Color(0xFF343A40);
  static const Color grayDark = Color(0xFF495057);
  static const Color grayLighter = Color(0xFFF1F3F5);
  static const Color border = Color(0xFFDEE2E6);
  static const Color white75 = Color(0xBFFFFFFF);

  // State colors
  static const Color successDarker = Color(0xFF66A80F);
  static const Color successBackground = Color(0x80A9E34B); // rgba(169,227,75,0.5)
  static const Color dangerDarker = Color(0xFFE03131);
  static const Color dangerBackground = Color(0x80FF8787); // rgba(255,135,135,0.5)
}
