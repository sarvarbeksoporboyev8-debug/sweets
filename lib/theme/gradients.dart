import 'package:flutter/material.dart';
import '../constants/colors.dart';

/// Gradient constants for the Sweets app.
/// Provides consistent gradient styles throughout the application.
class SweetsGradients {
  SweetsGradients._(); // Private constructor to prevent instantiation

  /// Primary header gradient - used for success screens and headers
  /// Gradient from light beige cream to white at 55%
  static const LinearGradient primaryHeader = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      SweetsColors.kCardBeige1, // Light cream
      Color(0xFFFFFFFF), // White
    ],
    stops: [0.0, 0.55],
  );

  /// Success screen background gradient
  /// Alias for primaryHeader for semantic clarity
  static const LinearGradient successBackground = primaryHeader;
}
