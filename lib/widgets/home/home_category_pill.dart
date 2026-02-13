import 'package:flutter/material.dart';
import '../../theme/sweets_theme.dart';
import '../../constants/colors.dart';
import '../../constants/spacing.dart';

class HomeCategoryPill extends StatelessWidget {
  const HomeCategoryPill({
    super.key,
    required this.label,
    required this.imageUrl,
    this.colorIndex = 0, // Index for pastel color rotation
    this.onTap,
  });

  final String label;
  final String imageUrl;
  final int colorIndex;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    // Get pastel color based on index rotation
    final cardColor = SweetsColors.cardColorsPastel[colorIndex % SweetsColors.cardColorsPastel.length];
    
    return Padding(
      padding: const EdgeInsets.only(right: Spacing.sm),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: cardColor, // Use pastel color rotation
              borderRadius: BorderRadius.circular(Spacing.spacing12),
            ),
            child: Center(
              child: Image.asset(
                imageUrl,
                width: 56,
                height: 56,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.local_cafe,
                    size: 32,
                    color: SweetsColors.textDark,
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: Spacing.sm),
          Text(
            label,
            style: const TextStyle(
              fontFamily: 'Geist',
              fontWeight: FontWeight.w400,
              fontSize: 12,
              height: 16 / 12,
              color: SweetsColors.grayDarker,
            ),
          ),
        ],
      ),
      ),
    );
  }
}
