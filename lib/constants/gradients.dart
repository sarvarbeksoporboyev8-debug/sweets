import 'package:flutter/material.dart';
import '../constants/colors.dart';

/// Gradient definitions used throughout the app
class AppGradients {
  /// Header gradient - used in most screen headers
  /// Updated to use new coral primary color
  static const LinearGradient headerGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      SweetsColors.primary, // #FF7F6B (Coral)
      SweetsColors.background, // #FFFFFF (White)
    ],
  );

  /// Radial gradient for about us hero section
  /// Updated to use new coral primary color
  static const RadialGradient heroGradient = RadialGradient(
    center: Alignment(0, -0.2182),
    radius: 0.7399,
    colors: [
      SweetsColors.background, // #FFFFFF (White)
      SweetsColors.primary, // #FF7F6B (Coral)
    ],
    stops: [0.0, 1.0],
  );
}

/// Sweets-specific gradient definitions used throughout the app
class SweetsGradients {
  SweetsGradients._(); // Private constructor to prevent instantiation

  // ===== PASTEL CARD GRADIENTS =====
  static const LinearGradient cardPurple = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFE0D5F2), Color(0xFFC9B5E0)],
  );

  static const LinearGradient cardCyan = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFD1F2F0), Color(0xFFA8E6E1)],
  );

  static const LinearGradient cardPeach = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFFAE6DC), Color(0xFFF5D5C8)],
  );

  static const LinearGradient cardYellow = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFFBF8E0), Color(0xFFF5F0C8)],
  );

  // Array of gradients for easy rotation
  static const List<LinearGradient> cardGradients = [
    cardPurple,
    cardCyan,
    cardPeach,
    cardYellow,
  ];

  // Optional: Promo banner gradient (can use cyan or custom)
  static const LinearGradient promoBanner = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFD1F2F0), Color(0xFFA8E6E1)],
  );

  /// Primary header gradient - used for success screens and headers
  /// Updated to use new coral theme colors
  static const LinearGradient primaryHeader = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      SweetsColors.primary, // #FF7F6B (Coral)
      SweetsColors.background, // #FFFFFF (White)
    ],
    stops: [0.0, 0.55],
  );

  /// Success screen background gradient
  /// Alias for primaryHeader for semantic clarity
  static const LinearGradient successBackground = primaryHeader;

  /// Pastel card gradients (backward compatibility)
  static const LinearGradient kBeigeCardGradient = cardPurple;

  /// Alternative gradient with more depth (backward compatibility)
  static const LinearGradient kBeigeCardGradientDeep = cardCyan;
}
