import 'package:flutter/material.dart';
import '../../theme/sweets_theme.dart';
import '../../constants/colors.dart';
import '../../constants/spacing.dart';

/// Driver/butler contact card widget
class DeliveryDriverCard extends StatelessWidget {
  const DeliveryDriverCard({
    super.key,
    this.driverImageUrl,
    this.onContactTap,
  });

  final String? driverImageUrl;
  final VoidCallback? onContactTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 44,
          height: 44,
          child: ClipOval(
            child: driverImageUrl != null
                ? Image.asset(
                    driverImageUrl!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return _buildDefaultAvatar();
                    },
                  )
                : _buildDefaultAvatar(),
          ),
        ),
        const SizedBox(width: Spacing.sm),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Contact your butler',
                style: TextStyle(
                  fontFamily: 'Geist',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  height: 24 / 16,
                  color: SweetsColors.black,
                ),
              ),
              SizedBox(height: Spacing.xs),
              Text(
                'How we can help you ?',
                style: TextStyle(
                  fontFamily: 'Geist',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  height: 20 / 14,
                  color: SweetsColors.gray,
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: onContactTap,
          child: Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: SweetsColors.white,
              border: Border.all(
                color: SweetsColors.border.withOpacity(0.75),
              ),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.message,
              color: SweetsColors.grayDarker,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDefaultAvatar() {
    return Container(
      width: 44,
      height: 44,
      decoration: const BoxDecoration(
        color: SweetsColors.grayLighter,
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.person,
        color: SweetsColors.grayDarker,
        size: 24,
      ),
    );
  }
}
