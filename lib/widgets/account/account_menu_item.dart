import 'package:flutter/material.dart';
import '../../theme/sweets_theme.dart';
import '../../constants/colors.dart';
import '../../constants/spacing.dart';

/// Account menu item widget for navigation and actions
class AccountMenuItem extends StatelessWidget {
  const AccountMenuItem({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(Spacing.md),
        decoration: BoxDecoration(
          color: SweetsColors.grayLighter.withOpacity(0.5),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 20,
              color: SweetsColors.grayDarker,
            ),
            const SizedBox(width: Spacing.sm),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  fontFamily: 'Geist',
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  height: 20 / 14,
                  color: SweetsColors.grayDarker,
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 20,
              color: SweetsColors.grayDarker,
            ),
          ],
        ),
      ),
    );
  }
}

/// Logout menu item with special styling
class LogoutMenuItem extends StatelessWidget {
  const LogoutMenuItem({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(Spacing.md),
        child: Row(
          children: [
            const Icon(
              Icons.logout,
              size: 20,
              color: Color(0xFFFA5252),
            ),
            const SizedBox(width: Spacing.sm),
            const Expanded(
              child: Text(
                'Logout',
                style: TextStyle(
                  fontFamily: 'Geist',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  height: 24 / 16,
                  color: Color(0xFFFA5252),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
