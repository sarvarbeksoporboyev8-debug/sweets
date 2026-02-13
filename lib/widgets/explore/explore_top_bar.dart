import 'package:flutter/material.dart';
import '../../theme/sweets_theme.dart';
import '../../constants/colors.dart';
import '../../constants/spacing.dart';
import '../home/shirin_biscuit_header.dart';

class ExploreTopBar extends StatelessWidget {
  const ExploreTopBar({super.key});

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
              const ShirinBiscuitHeader(),
              GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('/notifications');
                    },
                    child: Stack(
                      children: [
                        Container(
                          width: 36,
                          height: 36,
                          decoration: const BoxDecoration(
                            color: SweetsColors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x0D000000),
                                offset: Offset(0, 1),
                                blurRadius: 3,
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.notifications_none_rounded,
                            size: 24,
                            color: SweetsColors.grayDarker,
                          ),
                        ),
                        const Positioned(
                          right: 8,
                          top: 8,
                          child: CircleAvatar(
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
