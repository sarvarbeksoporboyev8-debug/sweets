import 'package:flutter/material.dart';
import '../theme/sweets_theme.dart';

class SweetsNavigationBar extends StatelessWidget {
  const SweetsNavigationBar({
    super.key,
    required this.title,
    this.onBack,
  });

  final String title;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: onBack ?? () => Navigator.of(context).maybePop(),
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 20,
                color: SweetsColors.primary,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              title,
              style: theme.textTheme.bodySmall?.copyWith(
                color: SweetsColors.grayDarker,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

