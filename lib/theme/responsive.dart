import 'package:flutter/material.dart';

/// Responsive utilities for the Sweets app.
/// Provides helpers for responsive design and breakpoints.
class ResponsiveUtils {
  ResponsiveUtils._(); // Private constructor to prevent instantiation

  /// Get responsive font size based on screen height
  /// Used for scaling text on different screen sizes
  static double responsiveFontSize(BuildContext context, double factor) {
    final screenHeight = MediaQuery.of(context).size.height;
    return screenHeight * factor;
  }

  /// Get responsive size based on screen height
  /// Used for scaling elements on different screen sizes
  static double responsiveHeight(BuildContext context, double factor) {
    final screenHeight = MediaQuery.of(context).size.height;
    return screenHeight * factor;
  }

  /// Get responsive size based on screen width
  /// Used for scaling elements on different screen sizes
  static double responsiveWidth(BuildContext context, double factor) {
    final screenWidth = MediaQuery.of(context).size.width;
    return screenWidth * factor;
  }

  /// Check if the screen is small (height < 600)
  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.height < 600;
  }

  /// Check if the screen is medium (600 <= height < 900)
  static bool isMediumScreen(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return height >= 600 && height < 900;
  }

  /// Check if the screen is large (height >= 900)
  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.height >= 900;
  }
}
