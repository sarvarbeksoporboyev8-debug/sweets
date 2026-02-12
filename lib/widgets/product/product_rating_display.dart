import 'package:flutter/material.dart';
import '../../theme/sweets_theme.dart';
import '../../constants/spacing.dart';

/// Reusable product rating display component
class ProductRatingDisplay extends StatelessWidget {
  final double rating;
  final int reviewCount;
  
  const ProductRatingDisplay({
    super.key,
    required this.rating,
    required this.reviewCount,
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Spacing.md,
        vertical: Spacing.sm,
      ),
      decoration: BoxDecoration(
        color: SweetsColors.white,
        borderRadius: BorderRadius.circular(Spacing.borderRadiusXl),
        border: Border.all(
          color: SweetsColors.border.withOpacity(0.75),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.star,
            size: Spacing.iconXs,
            color: SweetsColors.grayDark,
          ),
          SizedBox(width: Spacing.xs),
          Text(
            rating.toStringAsFixed(1),
            style: const TextStyle(
              fontFamily: 'Geist',
              fontWeight: FontWeight.w400,
              fontSize: 12,
              height: 16 / 12,
              color: SweetsColors.grayDark,
            ),
          ),
          const Text(
            '.',
            style: TextStyle(
              fontFamily: 'Geist',
              fontWeight: FontWeight.w400,
              fontSize: 12,
              height: 16 / 12,
              color: SweetsColors.grayDark,
            ),
          ),
          Text(
            '$reviewCount Reviews',
            style: const TextStyle(
              fontFamily: 'Geist',
              fontWeight: FontWeight.w400,
              fontSize: 12,
              height: 16 / 12,
              color: SweetsColors.grayDark,
            ),
          ),
        ],
      ),
    );
  }
}
