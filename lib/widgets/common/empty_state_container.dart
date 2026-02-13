import 'package:flutter/material.dart';
import '../../theme/sweets_theme.dart';
import '../../constants/colors.dart';
import '../../constants/spacing.dart';

/// Reusable empty state container for cart, favorites, notifications, etc.
class EmptyStateContainer extends StatelessWidget {
  final String imagePath;
  final IconData? fallbackIcon;
  final String title;
  final String message;
  final Widget? action;
  final bool showGradientBackground;
  
  const EmptyStateContainer({
    super.key,
    required this.imagePath,
    this.fallbackIcon,
    required this.title,
    required this.message,
    this.action,
    this.showGradientBackground = false,
  });
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (showGradientBackground)
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Container(
              height: 168,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    SweetsColors.cardPurpleLight, // Light pastel purple
                    Color(0xFFFFFFFF),
                  ],
                ),
              ),
            ),
          ),
        Center(
          child: Padding(
            padding: EdgeInsets.all(Spacing.lg),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: Spacing.emptyStateImageSize,
                  height: Spacing.emptyStateImageSize,
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        decoration: BoxDecoration(
                          color: SweetsColors.grayLighter,
                          borderRadius: BorderRadius.circular(Spacing.borderRadiusXl),
                        ),
                        child: Icon(
                          fallbackIcon ?? Icons.error_outline,
                          size: Spacing.iconLg,
                          color: SweetsColors.gray,
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: Spacing.sm),
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'Geist',
                    fontWeight: FontWeight.w600,
                    fontSize: 32,
                    height: 1.0,
                    letterSpacing: -0.96,
                    color: SweetsColors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: Spacing.sm),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 300),
                  child: Text(
                    message,
                    style: const TextStyle(
                      fontFamily: 'Geist',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      height: 24 / 16,
                      color: SweetsColors.grayDark,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                if (action != null) ...[
                  SizedBox(height: Spacing.xl),
                  action!,
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}
