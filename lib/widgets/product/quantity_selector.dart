import 'package:flutter/material.dart';
import '../../theme/sweets_theme.dart';
import '../../constants/spacing.dart';

/// Reusable quantity selector with increment/decrement buttons
class QuantitySelector extends StatelessWidget {
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback? onDecrement;
  
  const QuantitySelector({
    super.key,
    required this.quantity,
    required this.onIncrement,
    this.onDecrement,
  });
  
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Qty :',
          style: TextStyle(
            fontFamily: 'Geist',
            fontWeight: FontWeight.w400,
            fontSize: 16,
            height: 24 / 16,
            color: SweetsColors.grayDarker,
          ),
        ),
        Row(
          children: [
            GestureDetector(
              onTap: onDecrement,
              child: Container(
                padding: const EdgeInsets.all(2),
                child: Icon(
                  Icons.remove_circle_outline,
                  size: Spacing.iconMd,
                  color: onDecrement == null 
                      ? SweetsColors.gray 
                      : SweetsColors.grayDarker,
                ),
              ),
            ),
            SizedBox(width: Spacing.md),
            SizedBox(
              width: 28,
              child: Text(
                quantity.toString().padLeft(2, '0'),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Geist',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  height: 24 / 16,
                  color: SweetsColors.grayDarker,
                ),
              ),
            ),
            SizedBox(width: Spacing.md),
            GestureDetector(
              onTap: onIncrement,
              child: Container(
                padding: const EdgeInsets.all(2),
                child: const Icon(
                  Icons.add_circle_outline,
                  size: Spacing.iconMd,
                  color: SweetsColors.grayDarker,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
