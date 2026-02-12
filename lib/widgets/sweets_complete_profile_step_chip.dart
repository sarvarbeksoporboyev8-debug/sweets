import 'package:flutter/material.dart';
import '../theme/sweets_theme.dart';
import '../constants/colors.dart';

/// Step chip for "05  Complete profile" used in the onboarding flow.
///
/// This is a standalone widget so you can drop it into any layout.
class SweetsCompleteProfileStepChip extends StatelessWidget {
  const SweetsCompleteProfileStepChip({super.key});

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
            child: const Text(
              '05',
              style: TextStyle(
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
            child: const Text(
              'Complete profile',
              style: TextStyle(
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

