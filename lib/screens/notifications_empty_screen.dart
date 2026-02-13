import 'package:flutter/material.dart';
import '../theme/sweets_theme.dart';
import '../constants/colors.dart';
import '../widgets/sweets_home_indicator.dart';
import '../widgets/support/empty_state_message.dart';
import '../constants/spacing.dart';
import '../constants/gradients.dart';

// From Figma get_design_context (will periodically expire and can be replaced)
const _notificationsImageUrl =
    'images/figma/150a0efc-b6bc-4ecd-96b1-f07dcb48a03e.png';

class NotificationsEmptyScreen extends StatelessWidget {
  const NotificationsEmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SweetsColors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Content area
            Expanded(
              child: Column(
                children: [
                  // Navigation bar
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Spacing.lg,
                      vertical: 10,
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 20,
                            color: SweetsColors.grayDarker,
                          ),
                        ),
                        const SizedBox(width: Spacing.sm),
                        const Text(
                          'Notifications',
                          style: TextStyle(
                            fontFamily: 'Geist',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            height: 20 / 14,
                            color: SweetsColors.grayDarker,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Empty state message
                  const Expanded(
                    child: EmptyStateMessage(
                      title: 'No notifications',
                      message:
                          'Unfortunately, there are no alerts at the moment.',
                      illustrationUrl: _notificationsImageUrl,
                      illustrationIcon: Icons.notifications_none,
                    ),
                  ),
                  const SweetsHomeIndicator(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

