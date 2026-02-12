import 'package:flutter/material.dart';
import '../../theme/sweets_theme.dart';
import '../../constants/colors.dart';

/// Reusable star rating widget component
class StarRatingWidget extends StatelessWidget {
  const StarRatingWidget({
    super.key,
    required this.rating,
    required this.onRatingChanged,
    this.starSize = 28.0,
    this.interactive = true,
  });

  final int rating;
  final ValueChanged<int> onRatingChanged;
  final double starSize;
  final bool interactive;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        final starIndex = index + 1;
        return GestureDetector(
          onTap: interactive ? () => onRatingChanged(starIndex) : null,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Icon(
              Icons.star,
              size: starSize,
              color: index < rating
                  ? SweetsColors.primary
                  : SweetsColors.primary.withOpacity(0.5),
            ),
          ),
        );
      }),
    );
  }
}
