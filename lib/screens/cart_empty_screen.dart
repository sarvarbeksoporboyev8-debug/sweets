import 'package:flutter/material.dart';
import '../theme/sweets_theme.dart';
import '../constants/colors.dart';
import '../constants/spacing.dart';
import '../widgets/sweets_home_indicator.dart';
import '../widgets/common/empty_state_container.dart';

class CartEmptyScreen extends StatelessWidget {
  const CartEmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SweetsColors.white,
      body: EmptyStateContainer(
        imagePath: 'images/figma/d642c98f-5db5-48aa-9670-f592839e6904.png',
        fallbackIcon: Icons.shopping_bag_outlined,
        title: 'Unfortunately!',
        message: 'The cart is empty. Try exploring the products now.',
        showGradientBackground: true,
      ),
      bottomNavigationBar: const _CartEmptyTabBar(),
    );
  }
}

class _CartEmptyTabBar extends StatelessWidget {
  const _CartEmptyTabBar();

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
              ),
            ),
          ),
          padding: EdgeInsets.symmetric(vertical: Spacing.sm),
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
          padding: EdgeInsets.all(Spacing.sm),
          decoration: BoxDecoration(
            color: active ? SweetsColors.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(Spacing.borderRadius),
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
            size: Spacing.iconMd,
            color: active ? SweetsColors.white : SweetsColors.grayDarker,
          ),
        ),
        SizedBox(height: Spacing.xs),
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
