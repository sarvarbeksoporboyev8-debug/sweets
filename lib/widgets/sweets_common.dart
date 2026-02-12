import 'package:flutter/material.dart';
import '../theme/sweets_theme.dart';
import '../constants/spacing.dart';

/// A reusable card widget for displaying content with consistent styling.
class SweetsCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final VoidCallback? onTap;

  const SweetsCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Widget card = Container(
      padding: padding ?? const EdgeInsets.all(SweetsSpacing.padding),
      margin: margin,
      decoration: BoxDecoration(
        color: color ?? SweetsColors.white,
        borderRadius: BorderRadius.circular(SweetsSpacing.radiusLarge),
        border: Border.all(
          color: SweetsColors.border,
          width: 1,
        ),
      ),
      child: child,
    );

    if (onTap != null) {
      return InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(SweetsSpacing.radiusLarge),
        child: card,
      );
    }

    return card;
  }
}

/// A reusable list item widget with consistent styling.
class SweetsListItem extends StatelessWidget {
  final Widget leading;
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  const SweetsListItem({
    super.key,
    required this.leading,
    required this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: SweetsSpacing.padding,
          vertical: SweetsSpacing.paddingSmall,
        ),
        child: Row(
          children: [
            leading,
            const SizedBox(width: SweetsSpacing.gap),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontFamily: 'Geist',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      height: 24 / 16,
                      color: SweetsColors.black,
                    ),
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: SweetsSpacing.xs),
                    Text(
                      subtitle!,
                      style: const TextStyle(
                        fontFamily: 'Geist',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        height: 20 / 14,
                        color: SweetsColors.gray,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            if (trailing != null) ...[
              const SizedBox(width: SweetsSpacing.gap),
              trailing!,
            ],
          ],
        ),
      ),
    );
  }
}

/// A reusable image container with error handling.
class SweetsImage extends StatelessWidget {
  final String assetPath;
  final double? width;
  final double? height;
  final BoxFit fit;
  final IconData fallbackIcon;

  const SweetsImage({
    super.key,
    required this.assetPath,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.fallbackIcon = Icons.image,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      assetPath,
      width: width,
      height: height,
      fit: fit,
      errorBuilder: (context, error, stackTrace) {
        return Icon(
          fallbackIcon,
          size: width ?? height ?? SweetsSpacing.iconLarge,
          color: SweetsColors.gray,
        );
      },
    );
  }
}
