import 'package:flutter/material.dart';
import '../../theme/sweets_theme.dart';
import '../../constants/spacing.dart';

/// Star rating input widget
class RatingInputWidget extends StatelessWidget {
  const RatingInputWidget({
    super.key,
    required this.rating,
    required this.onRatingChanged,
    this.starCount = 5,
  });

  final int rating;
  final ValueChanged<int> onRatingChanged;
  final int starCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(starCount, (index) {
        return GestureDetector(
          onTap: () => onRatingChanged(index + 1),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Icon(
              Icons.star,
              size: 28,
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
