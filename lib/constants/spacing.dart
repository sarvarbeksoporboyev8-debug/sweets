/// Spacing constants for consistent padding and margins throughout the app
class Spacing {
  // Prevent instantiation
  Spacing._();
  
  // Base spacing unit (4px)
  static const double xs = 4.0;
  
  // Small spacing (8px)
  static const double sm = 8.0;
  
  // Medium spacing (12px)
  static const double md = 12.0;
  
  // Large spacing (16px)
  static const double lg = 16.0;
  
  // Extra large spacing (20px)
  static const double xl = 20.0;
  
  // Extra extra large spacing (24px)
  static const double xxl = 24.0;
  
  // 3x extra large spacing (32px)
  static const double xxxl = 32.0;
  
  // 4x extra large spacing (40px)
  static const double xxxxl = 40.0;
  
  // Huge spacing (40px) - alias for xxxxl
  static const double huge = 40.0;
  
  // Additional named spacing values
  static const double spacing12 = 12.0;
  static const double spacing20 = 20.0;
  static const double spacing40 = 40.0;
  
  // Padding variants
  static const double padding = 16.0;
  static const double paddingSmall = 8.0;
  static const double paddingLarge = 24.0;
  
  // Gap variants
  static const double gap = 12.0;
  static const double gapSmall = 8.0;
  static const double gapLg = 80.0;
  
  // Section spacing
  static const double sectionSpacing = 24.0;
  static const double headerSpacing = 24.0;
  
  // Card padding
  static const double cardPadding = 16.0;
  
  // Spacing for specific components
  static const double buttonHeight = 56.0;
  static const double buttonPadding = 14.0;
  
  // Border radius values
  static const double borderRadius = 8.0;
  static const double borderRadiusMd = 12.0;
  static const double borderRadiusLg = 16.0;
  static const double borderRadiusXl = 24.0;
  static const double borderRadiusRound = 28.0; // For pill-shaped badges
  
  // Radius aliases for consistency
  static const double radiusSmall = 8.0;
  static const double radiusMedium = 12.0;
  static const double radiusMd = 12.0;
  static const double radiusLarge = 16.0;
  static const double radiusLg = 16.0;
  static const double radiusXLarge = 24.0;
  static const double radiusXl = 24.0;
  
  // Icon sizes
  static const double iconXs = 16.0;
  static const double iconSmall = 16.0;
  static const double iconSm = 20.0;
  static const double iconMd = 24.0;
  static const double iconMedium = 24.0;
  static const double iconLg = 80.0;
  static const double iconLarge = 32.0;
  
  // Image sizes for empty states
  static const double emptyStateImageSize = 270.0;
}

/// Alias for Spacing class to support legacy code that uses SweetsSpacing
typedef SweetsSpacing = Spacing;
