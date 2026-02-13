import 'package:flutter/material.dart';
import '../../theme/sweets_theme.dart';
import '../../constants/colors.dart';
import '../../constants/spacing.dart';

class ExploreProductCard extends StatelessWidget {
  const ExploreProductCard({
    super.key,
    required this.title,
    required this.category,
    required this.price,
    required this.discountLabel,
    this.colorIndex = 0, // Index for pastel color rotation
    this.onTap,
    this.onAddToCart,
    this.onFavorite,
    this.productId,
  });

  final String title;
  final String category;
  final String price;
  final String discountLabel;
  final int colorIndex;
  final VoidCallback? onTap;
  final VoidCallback? onAddToCart;
  final VoidCallback? onFavorite;
  final String? productId;

  @override
  Widget build(BuildContext context) {
    // Get pastel color based on index rotation
    final cardColor = SweetsColors.cardColorsPastel[colorIndex % SweetsColors.cardColorsPastel.length];
    
    return GestureDetector(
      onTap: onTap,
      child: Container(
      width: double.infinity,
      padding: const EdgeInsets.all(Spacing.spacing12),
      decoration: BoxDecoration(
        color: SweetsColors.white,
        borderRadius: BorderRadius.circular(Spacing.md),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A343A40),
            offset: Offset(0, 12),
            blurRadius: 20,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(Spacing.sm),
                child: Image.asset(
                  'assets/images/product_tart.png',
                  height: 124,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 124,
                      color: SweetsColors.grayLighter,
                    );
                  },
                ),
              ),
              Positioned(
                right: Spacing.sm,
                top: Spacing.sm,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Spacing.xs,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: SweetsColors.buttonCoral, // Coral for discount badge
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    discountLabel,
                    style: const TextStyle(
                      fontFamily: 'Geist',
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      height: 16 / 12,
                      color: SweetsColors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: Spacing.spacing12),
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'Geist',
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    height: 18 / 18,
                    letterSpacing: -0.36,
                    color: SweetsColors.black,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: Spacing.sm,
                  vertical: Spacing.xs,
                ),
                decoration: BoxDecoration(
                  color: cardColor, // Use pastel color for category badge
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Text(
                  category,
                  style: const TextStyle(
                    fontFamily: 'Geist',
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    height: 16 / 12,
                    color: SweetsColors.textDark, // Dark text on pastel
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: Spacing.sm),
          Text(
            price,
            style: const TextStyle(
              fontFamily: 'Geist',
              fontWeight: FontWeight.w500,
              fontSize: 16,
              height: 24 / 16,
              color: SweetsColors.grayDarker,
            ),
          ),
          const SizedBox(height: Spacing.sm),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: onAddToCart,
                  child: Container(
                  height: Spacing.spacing40,
                  decoration: BoxDecoration(
                    color: SweetsColors.buttonCoral, // Coral for Add to cart button
                    borderRadius: BorderRadius.circular(Spacing.sm),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.shopping_bag_outlined,
                        size: 20,
                        color: SweetsColors.white,
                      ),
                      const SizedBox(width: Spacing.xs),
                      const Text(
                        'Add to cart',
                        style: TextStyle(
                          fontFamily: 'Geist',
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          height: 20 / 14,
                          color: SweetsColors.white,
                        ),
                      ),
                    ],
                  ),
                  ),
                ),
              ),
              const SizedBox(width: Spacing.sm),
              GestureDetector(
                onTap: onFavorite,
                child: Container(
                width: Spacing.spacing40,
                height: Spacing.spacing40,
                decoration: BoxDecoration(
                  color: SweetsColors.grayLighter,
                  borderRadius: BorderRadius.circular(Spacing.sm),
                ),
                child: const Icon(
                  Icons.favorite_border,
                  size: 20,
                  color: SweetsColors.buttonCoral, // Coral for heart icon
                ),
              ),
              ),
            ],
          ),
        ],
      ),
      ),
    );
  }
}
