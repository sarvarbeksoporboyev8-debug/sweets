import 'package:flutter/material.dart';
import '../constants/colors.dart';

class SweetsPrimaryButton extends StatelessWidget {
  const SweetsPrimaryButton({
    super.key,
    required this.label,
    this.onPressed,
  });

  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: 56,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: SweetsColors.buttonCoral, // Coral/Red #FF7F6B
          foregroundColor: SweetsColors.textOnCoral, // White text
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Text(
          label,
          style: theme.textTheme.labelLarge,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class SweetsSecondaryButton extends StatelessWidget {
  const SweetsSecondaryButton({
    super.key,
    required this.label,
    this.onPressed,
  });

  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: SweetsColors.grayLighter,
          foregroundColor: SweetsColors.gray,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontFamily: 'Geist',
            fontWeight: FontWeight.w500,
            fontSize: 16,
            height: 24 / 16,
            letterSpacing: 0,
            color: SweetsColors.gray,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

