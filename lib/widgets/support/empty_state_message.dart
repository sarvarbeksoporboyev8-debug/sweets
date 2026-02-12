import 'package:flutter/material.dart';
import '../../theme/sweets_theme.dart';
import '../../constants/colors.dart';
import '../../constants/spacing.dart';

/// Empty state message widget with illustration
class EmptyStateMessage extends StatelessWidget {
  const EmptyStateMessage({
    super.key,
    required this.title,
    required this.message,
    this.illustrationUrl,
    this.illustrationIcon = Icons.notifications_none,
  });

  final String title;
  final String message;
  final String? illustrationUrl;
  final IconData illustrationIcon;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (illustrationUrl != null)
            SizedBox(
              width: 270,
              height: 270,
              child: Image.asset(
                illustrationUrl!,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return _buildFallbackIllustration();
                },
              ),
            )
          else
            _buildFallbackIllustration(),
          const SizedBox(height: Spacing.sm),
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'Geist',
              fontWeight: FontWeight.w600,
              fontSize: 32,
              height: 32 / 32,
              letterSpacing: -0.96,
              color: SweetsColors.black,
            ),
          ),
          const SizedBox(height: Spacing.sm),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 286),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Geist',
                fontWeight: FontWeight.w400,
                fontSize: 16,
                height: 24 / 16,
                color: SweetsColors.grayDark,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFallbackIllustration() {
    return Container(
      width: 270,
      height: 270,
      decoration: BoxDecoration(
        color: SweetsColors.grayLighter,
        borderRadius: BorderRadius.circular(Spacing.radiusMd),
      ),
      child: Icon(
        illustrationIcon,
        size: 100,
        color: SweetsColors.gray,
      ),
    );
  }
}
