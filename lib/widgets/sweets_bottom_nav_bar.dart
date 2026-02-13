import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/spacing.dart';
import 'sweets_home_indicator.dart';

/// Reusable bottom navigation bar widget
class SweetsBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int>? onTap;

  const SweetsBottomNavBar({
    super.key,
    this.currentIndex = 0,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            color: SweetsColors.white,
            border: Border(
              top: BorderSide(
                color: SweetsColors.border.withOpacity(0.75),
                width: 1,
              ),
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: SweetsSpacing.gapSmall),
          child: SafeArea(
            top: false,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _NavItem(
                  label: 'Home',
                  icon: Icons.home_outlined,
                  activeIcon: Icons.home,
                  isActive: currentIndex == 0,
                  onTap: () => onTap?.call(0),
                ),
                _NavItem(
                  label: 'Explore',
                  icon: Icons.search_rounded,
                  activeIcon: Icons.search,
                  isActive: currentIndex == 1,
                  onTap: () => onTap?.call(1),
                ),
                _NavItem(
                  label: 'Favorites',
                  icon: Icons.favorite_border,
                  activeIcon: Icons.favorite,
                  isActive: currentIndex == 2,
                  onTap: () => onTap?.call(2),
                ),
                _NavItem(
                  label: 'Cart',
                  icon: Icons.shopping_bag_outlined,
                  activeIcon: Icons.shopping_bag,
                  isActive: currentIndex == 3,
                  onTap: () => onTap?.call(3),
                ),
                _NavItem(
                  label: 'Account',
                  icon: Icons.person_outline,
                  activeIcon: Icons.person,
                  isActive: currentIndex == 4,
                  onTap: () => onTap?.call(4),
                ),
              ],
            ),
          ),
        ),
        const SweetsHomeIndicator(),
      ],
    );
  }
}

/// Individual navigation item
class _NavItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final IconData? activeIcon;
  final bool isActive;
  final VoidCallback? onTap;

  const _NavItem({
    required this.label,
    required this.icon,
    this.activeIcon,
    required this.isActive,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(SweetsSpacing.radiusSmall),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: SweetsSpacing.gapSmall,
          vertical: SweetsSpacing.xs,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(SweetsSpacing.gapSmall),
              decoration: BoxDecoration(
                color: isActive ? SweetsColors.buttonCoral : Colors.transparent, // Coral for active
                borderRadius: BorderRadius.circular(SweetsSpacing.radiusSmall),
                boxShadow: isActive
                    ? [
                        BoxShadow(
                          color: SweetsColors.buttonCoral.withOpacity(0.4), // Coral shadow
                          blurRadius: 12,
                          offset: Offset(0, 6),
                        ),
                      ]
                    : null,
              ),
              child: Icon(
                isActive ? (activeIcon ?? icon) : icon,
                size: SweetsSpacing.iconMedium,
                color: isActive ? SweetsColors.white : SweetsColors.grayDarker,
              ),
            ),
            const SizedBox(height: SweetsSpacing.xs),
            Text(
              label,
              style: TextStyle(
                fontFamily: 'Geist',
                fontWeight: FontWeight.w400,
                fontSize: 12,
                height: 16 / 12,
                color: isActive ? SweetsColors.buttonCoral : const Color(0xFF475467), // Coral for active
              ),
            ),
          ],
        ),
      ),
    );
  }
}
