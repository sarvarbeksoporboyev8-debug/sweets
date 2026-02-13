import 'package:flutter/material.dart';
import '../constants/colors.dart';

/// Gradient definitions used throughout the app
class AppGradients {
  /// Header gradient - used in most screen headers
  /// Updated to use new primary color
  static const LinearGradient headerGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      SweetsColors.primary, // #D1B57C
      SweetsColors.background, // #E0D2BA
    ],
  );

  /// Radial gradient for about us hero section
  /// Updated to use new primary color
  static const RadialGradient heroGradient = RadialGradient(
    center: Alignment(0, -0.2182),
    radius: 0.7399,
    colors: [
      SweetsColors.background, // #E0D2BA
      SweetsColors.primary, // #D1B57C
    ],
    stops: [0.0, 1.0],
  );
}

/// Sweets-specific gradient definitions used throughout the app
class SweetsGradients {
  SweetsGradients._(); // Private constructor to prevent instantiation

  /// Primary header gradient - used for success screens and headers
  /// Updated to use new theme colors
  static const LinearGradient primaryHeader = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      SweetsColors.primary, // #D1B57C
      SweetsColors.background, // #E0D2BA
    ],
    stops: [0.0, 0.55],
  );

  /// Success screen background gradient
  /// Alias for primaryHeader for semantic clarity
  static const LinearGradient successBackground = primaryHeader;

  /// Primary beige card gradient
  static const LinearGradient kBeigeCardGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [SweetsColors.kCardBeige1, SweetsColors.kCardBeige2],
  );

  /// Alternative gradient with more depth/gold (use when needed)
  static const LinearGradient kBeigeCardGradientDeep = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [SweetsColors.kCardBeige1, SweetsColors.kCardBeige3],
  );
}
