import 'package:flutter/material.dart';

/// Color constants for the Sweets app
/// 
/// Custom theme colors:
/// - Background: #E0D2BA (RGB 224, 210, 186) - Main screen backgrounds
/// - Primary: #D1B57C (RGB 209, 181, 124) - Primary buttons and key accents
class SweetsColors {
  // Custom theme colors
  static const Color background = Color(0xFFE0D2BA); // RGB(224, 210, 186)
  static const Color primary = Color(0xFFD1B57C); // RGB(209, 181, 124)
  static const Color primaryAccent = Color(0xFFD1B57C); // Alias for consistency

  // Legacy primary colors (kept for backward compatibility)
  static const Color primaryOrange = Color(0xFFFD7E14); // Legacy primary
  static const Color primaryLighter = Color(0xFFFFA94D); // Legacy primary lighter
  static const Color primaryDark = Color(0xFFF76707); // Legacy primary dark

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
