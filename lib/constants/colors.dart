import 'package:flutter/material.dart';

/// Color constants for the Sweets app
/// 
/// Production theme colors - Pastel Rainbow with Coral/Red Primary:
/// - Page Background: #FFFFFF (Pure white) - Main screen backgrounds
/// - Card Colors: Pastel rainbow rotation (purple, cyan, peach, yellow)
/// - Primary Button: #FF7F6B (Coral/Red) - Primary buttons and key accents
class SweetsColors {
  // ===== PASTEL CARD COLORS =====
  static const Color cardPurple = Color(0xFFC9B5E0);    // Purple/Lavender
  static const Color cardCyan = Color(0xFFA8E6E1);      // Cyan/Turquoise
  static const Color cardPeach = Color(0xFFF5D5C8);     // Peach/Coral (light)
  static const Color cardYellow = Color(0xFFF5F0C8);    // Yellow/Cream
  
  // Lighter shades for gradients
  static const Color cardPurpleLight = Color(0xFFE0D5F2);
  static const Color cardCyanLight = Color(0xFFD1F2F0);
  static const Color cardPeachLight = Color(0xFFFAE6DC);
  static const Color cardYellowLight = Color(0xFFFBF8E0);

  // ===== PRIMARY BUTTON & ACCENT COLOR =====
  static const Color buttonCoral = Color(0xFFFF7F6B);   // Coral/Red
  static const Color primaryAccent = Color(0xFFFF7F6B); // Same as button
  static const Color accentRed = Color(0xFFFF7F6B);     // Alias

  // ===== PAGE BACKGROUND =====
  static const Color pageBackground = Color(0xFFFFFFFF); // White
  static const Color cardBackground = Color(0xFFFFFFFF); // White for some cards

  // ===== TEXT COLORS =====
  static const Color textDark = Color(0xFF2B2B2B);      // Dark text on light
  static const Color textMedium = Color(0xFF5C5C5C);    // Medium text
  static const Color textLight = Color(0xFF8B8B8B);     // Light text
  static const Color textOnCoral = Color(0xFFFFFFFF);   // White text on coral

  // ===== UTILITY =====
  // Array of card colors for rotation
  static const List<Color> cardColorsPastel = [
    cardPurple,
    cardCyan,
    cardPeach,
    cardYellow,
  ];

  // Lightest shades for backgrounds
  static const List<Color> cardColorsLight = [
    cardPurpleLight,
    cardCyanLight,
    cardPeachLight,
    cardYellowLight,
  ];

  // ===== BACKWARD COMPATIBILITY =====
  // Production theme colors
  static const Color kTopBar = Color(0xFFFFFFFF); // Pure white #FFFFFF
  static const Color kCreamBg = Color(0xFFFFFFFF); // Changed to white
  static const Color kCardWhite = Color(0xFFFFFFFF); // Card surfaces
  static const Color kCardShadow = Color(0x1A000000); // Subtle shadow
  static const Color kAccentGold = Color(0xFFFF7F6B); // Changed to coral
  static const Color kDarkText = Color(0xFF2B2B2B); // Dark text (updated)
  static const Color kLightText = Color(0xFF8B8B8B); // Light text (updated)

  // Legacy custom theme colors (updated to new colors)
  static const Color background = Color(0xFFFFFFFF); // White
  static const Color primary = Color(0xFFFF7F6B); // Coral/Red

  // Legacy primary colors (kept for backward compatibility)
  static const Color primaryOrange = Color(0xFFFD7E14); // Legacy primary
  static const Color primaryLighter = Color(0xFFFFA94D); // Legacy primary lighter
  static const Color primaryDark = Color(0xFFF76707); // Legacy primary dark

  // Beige card gradient colors (kept for backward compatibility but should use pastel)
  static const Color kCardBeige1 = Color(0xFFC9B5E0); // Now purple
  static const Color kCardBeige2 = Color(0xFFA8E6E1); // Now cyan
  static const Color kCardBeige3 = Color(0xFFF5D5C8); // Now peach

  // Text colors for cards - ensure high contrast
  static const Color kCardTextDark = Color(0xFF2B2B2B); // Dark text
  static const Color kCardTextMedium = Color(0xFF5C5C5C); // Medium text
  static const Color kCardTextLight = Color(0xFF8B8B8B); // Light text

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
