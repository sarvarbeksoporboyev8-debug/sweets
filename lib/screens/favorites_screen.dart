import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/sweets_theme.dart';
import '../constants/colors.dart';
import '../widgets/sweets_home_indicator.dart';
import '../widgets/sweets_alert.dart';
import '../providers/favorites_provider.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({
    super.key,
    this.showSuccessAlert = false,
  });

  final bool showSuccessAlert;

  @override
  Widget build(BuildContext context) {
    final favorites = context.watch<FavoritesProvider>();

    return Scaffold(
      backgroundColor: SweetsColors.white, // White background
      body: SafeArea(
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
                                color: SweetsColors.kCardBeige2,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(
                                  favorites.count.toString(),
                                  style: const TextStyle(
                                    fontFamily: 'Geist',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    height: 20 / 14,
                                    color: SweetsColors.kCardTextDark,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        if (favorites.isNotEmpty)
                          GestureDetector(
                            onTap: () {
                              favorites.clearAll();
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
                    child: favorites.isEmpty
                        ? _buildEmptyState(context)
                        : SingleChildScrollView(
                            padding: const EdgeInsets.only(
                              left: 16,
                              right: 16,
                              bottom: 100,
                            ),
                            child: Column(
                              children: favorites.favorites.map((product) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 8),
                                  child: _FavoriteItem(
                                    productId: product.productId,
                                    title: product.title,
                                    price: '\$${product.price.toStringAsFixed(2)}',
                                    quantity: 1,
                                    imageUrl: product.imageUrl ?? 'images/figma/49512945-95e0-4fa4-b16d-d674369991d2.png',
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        '/productDetail',
                                        arguments: {'productId': product.productId},
                                      );
                                    },
                                    onRemove: () {
                                      favorites.removeFavorite(product.productId);
                                    },
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                  ),
        ],
      ),
    ),
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.favorite_border,
              size: 80,
              color: SweetsColors.gray.withOpacity(0.5),
            ),
            const SizedBox(height: 24),
            const Text(
              'No favorites yet',
              style: TextStyle(
                fontFamily: 'Geist',
                fontWeight: FontWeight.w600,
                fontSize: 24,
                color: SweetsColors.grayDarker,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Start adding your favorite sweets!',
              style: TextStyle(
                fontFamily: 'Geist',
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: SweetsColors.gray,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/explore');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: SweetsColors.kAccentGold,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Continue Shopping',
                style: TextStyle(
                  fontFamily: 'Geist',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: SweetsColors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            color: SweetsColors.white,
            border: Border(
              top: BorderSide(
                color: SweetsColors.border.withOpacity(0.75),
              ),
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildTabItem(context, 'Home', Icons.home_filled, false),
              _buildTabItem(context, 'Explore', Icons.search_rounded, false),
              _buildTabItem(context, 'Favorites', Icons.favorite_border, true),
              _buildTabItem(context, 'Cart', Icons.shopping_bag_outlined, false),
              _buildTabItem(context, 'Account', Icons.person_outline, false),
            ],
          ),
        ),
        const SweetsHomeIndicator(),
      ],
    );
  }

  Widget _buildTabItem(BuildContext context, String label, IconData icon, bool active) {
    return GestureDetector(
      onTap: () {
        switch (label) {
          case 'Home':
            Navigator.pushReplacementNamed(context, '/home');
            break;
          case 'Explore':
            Navigator.pushReplacementNamed(context, '/explore');
            break;
          case 'Favorites':
            // Already on favorites
            break;
          case 'Cart':
            Navigator.pushReplacementNamed(context, '/cart');
            break;
          case 'Account':
            Navigator.pushReplacementNamed(context, '/account');
            break;
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: active ? SweetsColors.kAccentGold : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
              boxShadow: active
                  ? const [
                      BoxShadow(
                        color: Color(0x33D1B57C),
                        blurRadius: 12,
                        offset: Offset(0, 6),
                      ),
                    ]
                  : null,
            ),
            child: Icon(
              icon,
              size: 24,
              color: active ? SweetsColors.white : const Color(0xFFD1D5DB),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontFamily: 'Geist',
              fontWeight: FontWeight.w400,
              fontSize: 12,
              height: 16 / 12,
              color: active ? SweetsColors.kAccentGold : const Color(0xFF475467),
            ),
          ),
        ],
      ),
    );
  }
  }
}

class _FavoriteItem extends StatelessWidget {
  const _FavoriteItem({
    required this.productId,
    required this.title,
    required this.price,
    required this.quantity,
    required this.imageUrl,
    required this.onTap,
    required this.onRemove,
  });

  final String productId;
  final String title;
  final String price;
  final int quantity;
  final String imageUrl;
  final VoidCallback onTap;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
                      onTap: onRemove,
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
      ),
    );
  }
}

