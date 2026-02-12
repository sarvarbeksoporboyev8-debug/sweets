import 'package:flutter/material.dart';
import '../theme/sweets_theme.dart';
import '../widgets/sweets_home_indicator.dart';
import '../widgets/sweets_alert.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({
    super.key,
    this.showSuccessAlert = false,
  });

  final bool showSuccessAlert;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SweetsColors.white,
      body: Stack(
        children: [
          // Gradient background
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Container(
              height: 168,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFFFE6D1),
                    Color(0xFFFFFFFF),
                  ],
                ),
              ),
            ),
          ),
          // Main content
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Navigation bar
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 20,
                            color: SweetsColors.grayDarker,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'Wishlist',
                          style: TextStyle(
                            fontFamily: 'Geist',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            height: 20 / 14,
                            color: SweetsColors.grayDarker,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Header with title and delete all
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Favorites',
                              style: TextStyle(
                                fontFamily: 'Geist',
                                fontWeight: FontWeight.w600,
                                fontSize: 32,
                                height: 32 / 32,
                                letterSpacing: -0.96,
                                color: SweetsColors.black,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Container(
                              width: 28,
                              height: 28,
                              decoration: BoxDecoration(
                                color: SweetsColors.primaryLighter,
                                shape: BoxShape.circle,
                              ),
                              child: const Center(
                                child: Text(
                                  '20',
                                  style: TextStyle(
                                    fontFamily: 'Geist',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    height: 20 / 14,
                                    color: SweetsColors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            // TODO: Delete all favorites
                          },
                          child: const Text(
                            'Delete all',
                            style: TextStyle(
                              fontFamily: 'Geist',
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              height: 20 / 14,
                              color: Color(0xFFFA5252),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                        bottom: 100,
                      ),
                      child: Column(
                        children: const [
                          _FavoriteItem(
                            title: 'Macarons',
                            price: '\$15.55',
                            quantity: 2,
                            imageUrl:
                                'images/figma/49512945-95e0-4fa4-b16d-d674369991d2.png',
                          ),
                          SizedBox(height: 8),
                          _FavoriteItem(
                            title: 'Donuts',
                            price: '\$15.55',
                            quantity: 2,
                            imageUrl:
                                'images/figma/ecc936de-7166-4807-b7f5-198802e43197.png',
                          ),
                          SizedBox(height: 8),
                          _FavoriteItem(
                            title: 'Fruit tart',
                            price: '\$15.55',
                            quantity: 2,
                            imageUrl:
                                'images/figma/6b72a0e3-3c48-4bcb-be7b-5a13f42df332.png',
                          ),
                          SizedBox(height: 8),
                          _FavoriteItem(
                            title: 'Fruit tart',
                            price: '\$15.55',
                            quantity: 2,
                            imageUrl:
                                'images/figma/d9a89519-661a-4f29-a41a-403983efc844.png',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Home indicator
          const Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: SweetsHomeIndicator(),
          ),
        ],
      ),
    );
  }
}

class _FavoriteItem extends StatelessWidget {
  const _FavoriteItem({
    required this.title,
    required this.price,
    required this.quantity,
    required this.imageUrl,
  });

  final String title;
  final String price;
  final int quantity;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: SweetsColors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: SweetsColors.border.withOpacity(0.75),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A343A40),
            offset: Offset(0, 6),
            blurRadius: 12,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imageUrl,
              width: 98,
              height: 98,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 98,
                  height: 98,
                  decoration: BoxDecoration(
                    color: SweetsColors.grayLighter,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.image,
                    size: 40,
                    color: SweetsColors.gray,
                  ),
                );
              },
            ),
          ),
          const SizedBox(width: 12),
          // Product details
          Expanded(
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontFamily: 'Geist',
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        height: 18 / 18,
                        letterSpacing: -0.36,
                        color: SweetsColors.black,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Price : ',
                              style: TextStyle(
                                fontFamily: 'Geist',
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                height: 20 / 14,
                                color: SweetsColors.grayDark,
                              ),
                            ),
                            Text(
                              price,
                              style: const TextStyle(
                                fontFamily: 'Geist',
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                height: 20 / 14,
                                color: SweetsColors.grayDarker,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Text(
                              'Qty : ',
                              style: TextStyle(
                                fontFamily: 'Geist',
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                height: 20 / 14,
                                color: SweetsColors.grayDark,
                              ),
                            ),
                            Text(
                              quantity.toString().padLeft(2, '0'),
                              style: const TextStyle(
                                fontFamily: 'Geist',
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                height: 20 / 14,
                                color: SweetsColors.grayDarker,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: SweetsColors.grayLighter,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(
                            Icons.shopping_bag_outlined,
                            size: 20,
                            color: SweetsColors.gray,
                          ),
                          SizedBox(width: 4),
                          Text(
                            'Add to cart',
                            style: TextStyle(
                              fontFamily: 'Geist',
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              height: 20 / 14,
                              color: SweetsColors.gray,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // Delete button
                Positioned(
                  right: 0,
                  top: 0,
                  child: GestureDetector(
                    onTap: () {
                      // TODO: Delete favorite item
                    },
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: const Icon(
                        Icons.delete_outline,
                        size: 20,
                        color: SweetsColors.grayDarker,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

