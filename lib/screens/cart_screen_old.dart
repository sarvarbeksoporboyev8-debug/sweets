import 'package:flutter/material.dart';
import '../theme/sweets_theme.dart';
import '../constants/colors.dart';
import '../widgets/sweets_home_indicator.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

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
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  'Cart',
                                  style: TextStyle(
                                    fontFamily: 'Geist',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 32,
                                    height: 1.0,
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
                                // TODO: Delete all cart items
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
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                        bottom: 100,
                      ),
                      child: Column(
                        children: const [
                          _CartItem(
                            title: 'Macarons',
                            price: '\$15.55',
                            quantity: 2,
                            imageUrl:
                                'images/figma/c8744c0d-a1f2-44c6-b8a6-8dc1ecf24004.png',
                          ),
                          SizedBox(height: 8),
                          _CartItem(
                            title: 'Donuts',
                            price: '\$15.55',
                            quantity: 2,
                            imageUrl:
                                'images/figma/5e02251e-d20f-41c8-823f-c232783292db.png',
                          ),
                          SizedBox(height: 8),
                          _CartItem(
                            title: 'Fruit tart',
                            price: '\$15.55',
                            quantity: 2,
                            imageUrl:
                                'images/figma/378598d0-bcef-4f78-ac7e-43d695f82610.png',
                          ),
                          SizedBox(height: 8),
                          _CartItem(
                            title: 'Fruit tart',
                            price: '\$15.55',
                            quantity: 2,
                            imageUrl:
                                'images/figma/db7b8e08-a056-47f5-8109-9bd5a4d184e2.png',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Bottom tab bar
          const _CartTabBar(),
        ],
      ),
    );
  }
}

class _CartItem extends StatelessWidget {
  const _CartItem({
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
              width: 102,
              height: 102,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 102,
                  height: 102,
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
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: SweetsColors.primary),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        'Complete order',
                        style: TextStyle(
                          fontFamily: 'Geist',
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          height: 20 / 14,
                          color: SweetsColors.primary,
                        ),
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
                      // TODO: Delete cart item
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

class _CartTabBar extends StatelessWidget {
  const _CartTabBar();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Column(
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
              children: const [
                _TabItem(label: 'Home', icon: Icons.home_outlined, active: false),
                _TabItem(
                    label: 'Explore',
                    icon: Icons.search_rounded,
                    active: false),
                _TabItem(
                    label: 'Favorites',
                    icon: Icons.favorite_border,
                    active: false),
                _TabItem(
                    label: 'Cart',
                    icon: Icons.shopping_bag,
                    active: true),
                _TabItem(
                    label: 'Account',
                    icon: Icons.person_outline,
                    active: false),
              ],
            ),
          ),
          const SweetsHomeIndicator(),
        ],
      ),
    );
  }
}

class _TabItem extends StatelessWidget {
  const _TabItem({
    required this.label,
    required this.icon,
    required this.active,
  });

  final String label;
  final IconData icon;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: active ? SweetsColors.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            boxShadow: active
                ? const [
                    BoxShadow(
                      color: Color(0x66FD7E14),
                      blurRadius: 12,
                      offset: Offset(0, 6),
                    ),
                  ]
                : null,
          ),
          child: Icon(
            icon,
            size: 24,
            color: active ? SweetsColors.white : SweetsColors.grayDarker,
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
            color: active ? SweetsColors.primary : const Color(0xFF475467),
          ),
        ),
      ],
    );
  }
}
