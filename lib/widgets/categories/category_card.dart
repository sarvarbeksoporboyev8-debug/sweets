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
    this.colorIndex = 0, // Index for pastel color rotation
  });

  final String label;
  final String imageUrl;
  final VoidCallback? onTap;
  final bool isSelected;
  final int colorIndex;

  @override
  Widget build(BuildContext context) {
    // Get pastel color based on index rotation
    final cardColor = SweetsColors.cardColorsPastel[colorIndex % SweetsColors.cardColorsPastel.length];
    
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
                    ? SweetsColors.buttonCoral.withOpacity(0.2) // Coral tint when selected
                    : cardColor, // Pastel color rotation
                borderRadius: BorderRadius.circular(16),
                border: isSelected
                    ? Border.all(
                        color: SweetsColors.buttonCoral, // Coral border when selected
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
                      color: SweetsColors.textDark, // Consistent error icon color
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
                color: isSelected ? SweetsColors.buttonCoral : SweetsColors.grayDarker,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
