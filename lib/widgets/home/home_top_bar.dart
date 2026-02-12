import 'package:flutter/material.dart';
import '../../theme/sweets_theme.dart';
import '../../constants/spacing.dart';
import 'circle_icon_button.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key, required this.onMenuTap});

  final VoidCallback onMenuTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(
        top: Spacing.md,
        left: Spacing.md,
        right: Spacing.md,
        bottom: Spacing.spacing12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Image.asset(
                      'images/figma/bcbbd298-6443-4431-b696-509ef85e5849.png',
                      width: 36,
                      height: 36,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 36,
                          height: 36,
                          decoration: const BoxDecoration(
                            color: SweetsColors.grayLighter,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.person,
                            size: 20,
                            color: SweetsColors.gray,
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: Spacing.sm),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome 👋',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: SweetsColors.gray,
                        ),
                      ),
                      const SizedBox(height: 2),
                      const Text(
                        'John Smith',
                        style: TextStyle(
                          fontFamily: 'Geist',
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          height: 1.0,
                          letterSpacing: -0.32,
                          color: SweetsColors.grayDarker,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: onMenuTap,
                    child: const CircleIconButton(
                      icon: Icons.more_horiz,
                    ),
                  ),
                  const SizedBox(width: Spacing.sm),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('/notifications');
                    },
                    child: Stack(
                      children: [
                        const CircleIconButton(
                          icon: Icons.notifications_none_rounded,
                        ),
                        Positioned(
                          right: 8,
                          top: 8,
                          child: const CircleAvatar(
                            radius: 5,
                            backgroundColor: SweetsColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: Spacing.spacing12),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 14,
            ),
            decoration: BoxDecoration(
              color: SweetsColors.white,
              borderRadius: BorderRadius.circular(Spacing.spacing12),
              border: Border.all(color: SweetsColors.border),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.search,
                  size: 20,
                  color: SweetsColors.gray,
                ),
                const SizedBox(width: Spacing.xs),
                Text(
                  'Search',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: SweetsColors.gray,
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
