import 'package:flutter/material.dart';
import '../../theme/sweets_theme.dart';
import '../../constants/colors.dart';
import '../../constants/spacing.dart';

class HomeCategoryPill extends StatelessWidget {
  const HomeCategoryPill({
    super.key,
    required this.label,
    required this.imageUrl,
  });

  final String label;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: Spacing.sm),
      child: Column(
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: SweetsColors.kCardBeige2,
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
                    color: SweetsColors.primary,
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
    );
  }
}
