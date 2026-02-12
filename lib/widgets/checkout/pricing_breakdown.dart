import 'package:flutter/material.dart';
import '../../theme/sweets_theme.dart';
import '../../constants/colors.dart';

/// Reusable widget for displaying pricing breakdown rows
class PricingBreakdown extends StatelessWidget {
  const PricingBreakdown({
    super.key,
    required this.label,
    required this.value,
    this.isTotal = false,
  });

  final String label;
  final String value;
  final bool isTotal;

  @override
  Widget build(BuildContext context) {
    if (isTotal) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontFamily: 'Geist',
              fontWeight: FontWeight.w400,
              fontSize: 16,
              height: 24 / 16,
              color: SweetsColors.gray,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontFamily: 'Geist',
              fontWeight: FontWeight.w600,
              fontSize: 24,
              height: 24 / 24,
              letterSpacing: -0.72,
              color: SweetsColors.grayDarker,
            ),
          ),
        ],
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'Geist',
            fontWeight: FontWeight.w400,
            fontSize: 12,
            height: 16 / 12,
            color: SweetsColors.grayDark,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontFamily: 'Geist',
            fontWeight: FontWeight.w500,
            fontSize: 14,
            height: 20 / 14,
            color: SweetsColors.grayDarker,
          ),
        ),
      ],
    );
  }
}
