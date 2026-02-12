import 'package:flutter/material.dart';
import '../theme/sweets_theme.dart';

/// Generic step chip used for the numbered onboarding labels like
/// "06  Home", "07  Categories", "08  Explore", etc.
class SweetsStepChip extends StatelessWidget {
  const SweetsStepChip({
    super.key,
    required this.step,
    required this.label,
  });

  final String step;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 152,
            height: 127,
            color: SweetsColors.primary,
            alignment: Alignment.center,
            child: Text(
              step,
              style: const TextStyle(
                fontFamily: 'Geist',
                fontWeight: FontWeight.w500,
                fontSize: 64,
                height: 1.0,
                color: SweetsColors.white,
              ),
            ),
          ),
          Container(
            height: 127,
            padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 40),
            color: SweetsColors.white,
            alignment: Alignment.centerLeft,
            child: Text(
              label,
              style: const TextStyle(
                fontFamily: 'Geist',
                fontWeight: FontWeight.w400,
                fontSize: 36,
                height: 48 / 36,
                color: SweetsColors.grayDarker,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

