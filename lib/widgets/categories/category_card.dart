import 'package:flutter/material.dart';
import '../../theme/sweets_theme.dart';
import '../../constants/colors.dart';

/// Category card widget that displays a category with an image and label.
/// Supports flexible sizing and tap interactions.
class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.label,
    required this.imageUrl,
    this.onTap,
    this.isSelected = false,
  });

  final String label;
  final String imageUrl;
  final VoidCallback? onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 121,
        child: Column(
          children: [
            Container(
              width: 121,
              height: 121,
              decoration: BoxDecoration(
                color: isSelected 
                    ? SweetsColors.primary.withOpacity(0.1)
                    : const Color(0xFFFFDEBB),
                borderRadius: BorderRadius.circular(16),
                border: isSelected
                    ? Border.all(
                        color: SweetsColors.primary,
                        width: 2,
                      )
                    : null,
              ),
              child: Center(
                child: Image.asset(
                  imageUrl,
                  width: 96,
                  height: 96,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.local_cafe,
                      size: 40,
                      color: SweetsColors.primary,
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontFamily: 'Geist',
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                fontSize: 16,
                height: 24 / 16,
                color: isSelected ? SweetsColors.primary : SweetsColors.grayDarker,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
