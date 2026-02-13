import 'package:flutter/material.dart';
import '../theme/sweets_theme.dart';
import '../constants/colors.dart';
import 'sweets_home_indicator.dart';

/// Common tab bar widget for bottom navigation
class SweetsTabBar extends StatelessWidget {
  const SweetsTabBar({
    super.key,
    required this.activeTab,
    this.onTabTap,
  });

  final String activeTab; // 'Home', 'Explore', 'Favorites', 'Cart', 'Account'
  final Function(String)? onTabTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            color: SweetsColors.white, // White background
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
              _TabItem(
                label: 'Home',
                icon: Icons.home_filled,
                active: activeTab == 'Home',
                onTap: () => onTabTap?.call('Home'),
              ),
              _TabItem(
                label: 'Explore',
                icon: Icons.search_rounded,
                active: activeTab == 'Explore',
                onTap: () => onTabTap?.call('Explore'),
              ),
              _TabItem(
                label: 'Favorites',
                icon: Icons.favorite_border,
                active: activeTab == 'Favorites',
                onTap: () => onTabTap?.call('Favorites'),
              ),
              _TabItem(
                label: 'Cart',
                icon: Icons.shopping_bag_outlined,
                active: activeTab == 'Cart',
                onTap: () => onTabTap?.call('Cart'),
              ),
              _TabItem(
                label: 'Account',
                icon: Icons.person_outline,
                active: activeTab == 'Account',
                onTap: () => onTabTap?.call('Account'),
              ),
            ],
          ),
        ),
        const SweetsHomeIndicator(),
      ],
    );
  }
}

class _TabItem extends StatelessWidget {
  const _TabItem({
    required this.label,
    required this.icon,
    required this.active,
    this.onTap,
  });

  final String label;
  final IconData icon;
  final bool active;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: active ? SweetsColors.kAccentGold : Colors.transparent, // Gold when active
              borderRadius: BorderRadius.circular(8),
              boxShadow: active
                  ? const [
                      BoxShadow(
                        color: Color(0x33D1B57C), // Shadow matching gold
                        blurRadius: 12,
                        offset: Offset(0, 6),
                      ),
                    ]
                  : null,
            ),
            child: Icon(
              icon,
              size: 24,
              color: active ? SweetsColors.white : Color(0xFFD1D5DB), // Light gray when inactive
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
