import 'package:flutter/material.dart';

/// Gradient constants for consistent visual design throughout the app.
class SweetsGradients {
  /// Primary gradient used for headers and top bars
  static const LinearGradient primaryHeader = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFFFE6D1),
      Color(0xFFFFFFFF),
    ],
  );
  
  /// Alternative gradient for backgrounds
  static const LinearGradient backgroundSubtle = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFFFF8F0),
      Color(0xFFFFFFFF),
    ],
  );
}
