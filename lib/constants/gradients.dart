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
