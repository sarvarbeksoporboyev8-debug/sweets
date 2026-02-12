import 'package:flutter/material.dart';

/// Gradient definitions used throughout the app
class AppGradients {
  /// Header gradient - used in most screen headers
  static const LinearGradient headerGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFFFE6D1),
      Color(0xFFFFFFFF),
    ],
  );

  /// Radial gradient for about us hero section
  static const RadialGradient heroGradient = RadialGradient(
    center: Alignment(0, -0.2182),
    radius: 0.7399,
    colors: [
      Color(0xFFFFE6D1),
      Color(0xFFFD7E14),
    ],
    stops: [0.0, 1.0],
  );
}

/// Sweets-specific gradient definitions used throughout the app
class SweetsGradients {
  SweetsGradients._(); // Private constructor to prevent instantiation

  /// Primary header gradient - used for success screens and headers
  /// Gradient from light peach (#FFE6D1) to white at 55%
  static const LinearGradient primaryHeader = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFFFE6D1), // Light peach
      Color(0xFFFFFFFF), // White
    ],
    stops: [0.0, 0.55],
  );

  /// Success screen background gradient
  /// Alias for primaryHeader for semantic clarity
  static const LinearGradient successBackground = primaryHeader;
}
