import 'package:flutter/material.dart';
import '../theme/sweets_theme.dart';
import '../constants/colors.dart';
import '../widgets/sweets_home_indicator.dart';

class FavoritesEmptyScreen extends StatelessWidget {
  const FavoritesEmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SweetsColors.kCreamBg,
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
                    SweetsColors.kTopBar,
                    Color(0xFFFFFFFF),
                  ],
                ),
              ),
            ),
          ),
          // Empty state content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 270,
                  height: 270,
                  child: Image.asset('images/figma/8dfa1e99-6d4a-4889-9e55-86891e15ab63.png',
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 270,
                        height: 270,
                        decoration: BoxDecoration(
                          color: SweetsColors.grayLighter,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: const Icon(
                          Icons.favorite_border,
                          size: 80,
                          color: SweetsColors.gray,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Unfortunately!',
                  style: TextStyle(
                    fontFamily: 'Geist',
                    fontWeight: FontWeight.w600,
                    fontSize: 32,
                    height: 1.0,
                    letterSpacing: -0.96,
                    color: SweetsColors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: 270,
                  child: const Text(
                    'Your favorites list is empty, try exploring products now.',
                    style: TextStyle(
                      fontFamily: 'Geist',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      height: 24 / 16,
                      color: SweetsColors.grayDark,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          // Bottom tab bar
          const _FavoritesEmptyTabBar(),
        ],
      ),
    );
  }
}

class _FavoritesEmptyTabBar extends StatelessWidget {
  const _FavoritesEmptyTabBar();

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
                    icon: Icons.favorite,
                    active: true),
                _TabItem(
                    label: 'Cart',
                    icon: Icons.shopping_bag_outlined,
                    active: false),
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
