import 'package:flutter/material.dart';

/// Responsive utilities for adaptive layouts across different screen sizes.
class Responsive {
  /// Mobile breakpoint (phones)
  static const double mobile = 600;
  
  /// Tablet breakpoint
  static const double tablet = 900;
  
  /// Desktop breakpoint
  static const double desktop = 1200;
  
  /// Check if current device is mobile
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < mobile;
  }
  
  /// Check if current device is tablet
  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= mobile && width < desktop;
  }
  
  /// Check if current device is desktop
  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= desktop;
  }
  
  /// Get responsive value based on screen size
  static T valueWhen<T>({
    required BuildContext context,
    required T mobile,
    T? tablet,
    T? desktop,
  }) {
    if (isDesktop(context) && desktop != null) {
      return desktop;
    }
    if (isTablet(context) && tablet != null) {
      return tablet;
    }
    return mobile;
  }
  
  /// Get responsive grid column count
  static int getGridColumns(BuildContext context, {
    int mobileColumns = 2,
    int tabletColumns = 3,
    int desktopColumns = 4,
  }) {
    if (isDesktop(context)) return desktopColumns;
    if (isTablet(context)) return tabletColumns;
    return mobileColumns;
  }
}
