import 'package:flutter/material.dart';
import '../../theme/sweets_theme.dart';
import '../../constants/spacing.dart';

/// Product information section displaying name, category, price
class ProductInfoSection extends StatelessWidget {
  final String name;
  final String category;
  final double price;
  
  const ProductInfoSection({
    super.key,
    required this.name,
    required this.category,
    required this.price,
  });
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: Spacing.sm,
            vertical: Spacing.xs,
          ),
          decoration: BoxDecoration(
            color: SweetsColors.primaryLighter,
            borderRadius: BorderRadius.circular(28),
          ),
          child: Text(
            category,
            style: const TextStyle(
              fontFamily: 'Geist',
              fontWeight: FontWeight.w400,
              fontSize: 12,
              height: 16 / 12,
              color: SweetsColors.black,
            ),
          ),
        ),
        SizedBox(height: Spacing.sm),
        Text(
          name,
          style: const TextStyle(
            fontFamily: 'Geist',
            fontWeight: FontWeight.w600,
            fontSize: 32,
            height: 1.0,
            letterSpacing: -0.96,
            color: SweetsColors.black,
          ),
        ),
        SizedBox(height: Spacing.md),
        Row(
          children: [
            const Text(
              'Price : ',
              style: TextStyle(
                fontFamily: 'Geist',
                fontWeight: FontWeight.w400,
                fontSize: 16,
                height: 24 / 16,
                color: SweetsColors.grayDark,
              ),
            ),
            Text(
              '\$${price.toStringAsFixed(2)}',
              style: const TextStyle(
                fontFamily: 'Geist',
                fontWeight: FontWeight.w600,
                fontSize: 18,
                height: 18 / 18,
                letterSpacing: -0.36,
                color: SweetsColors.grayDarker,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
