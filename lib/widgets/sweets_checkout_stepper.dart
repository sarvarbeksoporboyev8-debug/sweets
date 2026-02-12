import 'package:flutter/material.dart';
import '../theme/sweets_theme.dart';

class SweetsCheckoutStepper extends StatelessWidget {
  const SweetsCheckoutStepper({
    super.key,
    required this.currentStep,
  });

  final int currentStep; // 0: payment method, 1: delivery, 2: complete

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _Step(
            stepNumber: 1,
            label: 'Choose a payment method',
            isActive: currentStep == 0,
            isCompleted: currentStep > 0,
          ),
        ),
        Container(
          width: 84,
          height: 1,
          margin: const EdgeInsets.only(bottom: 22),
          color: currentStep > 0
              ? SweetsColors.primary
              : SweetsColors.border,
        ),
        Expanded(
          child: _Step(
            stepNumber: 2,
            label: 'Specify the delivery location',
            isActive: currentStep == 1,
            isCompleted: currentStep > 1,
          ),
        ),
        Container(
          width: 84,
          height: 1,
          margin: const EdgeInsets.only(bottom: 22),
          color: currentStep > 1
              ? SweetsColors.primary
              : SweetsColors.border,
        ),
        Expanded(
          child: _Step(
            stepNumber: 3,
            label: 'Complete your\norder',
            isActive: currentStep == 2,
            isCompleted: false,
          ),
        ),
      ],
    );
  }
}

class _Step extends StatelessWidget {
  const _Step({
    required this.stepNumber,
    required this.label,
    required this.isActive,
    required this.isCompleted,
  });

  final int stepNumber;
  final String label;
  final bool isActive;
  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: isActive || isCompleted
                ? SweetsColors.primary
                : SweetsColors.grayLighter,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: isCompleted
                ? const Icon(
                    Icons.check,
                    color: SweetsColors.white,
                    size: 24,
                  )
                : Text(
                    '$stepNumber',
                    style: TextStyle(
                      fontFamily: 'Geist',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: isActive || isCompleted
                          ? SweetsColors.white
                          : SweetsColors.grayDarker,
                    ),
                  ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'Geist',
            fontWeight: FontWeight.w500,
            fontSize: 12,
            height: 16 / 12,
            color: SweetsColors.grayDarker,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
