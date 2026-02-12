import 'package:flutter/material.dart';
import '../theme/sweets_theme.dart';
import '../widgets/sweets_home_indicator.dart';
import '../widgets/sweets_button.dart';
import '../widgets/support/empty_state_message.dart';
import '../constants/spacing.dart';

class TrackOrderDeliveredScreen extends StatelessWidget {
  const TrackOrderDeliveredScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SweetsColors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Navigation bar
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: Spacing.lg,
                vertical: 10,
              ),
              color: SweetsColors.white,
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
                    'Track order',
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
            // Main content
            const Expanded(
              child: EmptyStateMessage(
                title: 'Congratulations',
                message: 'You\'re product has been delivered successfully.',
                illustrationUrl:
                    'images/figma/218dd5f2-15c0-4451-ba36-77383bad6442.png',
                illustrationIcon: Icons.check_circle,
              ),
            ),
            // Bottom button
            Container(
              padding: const EdgeInsets.all(Spacing.lg),
              decoration: BoxDecoration(
                color: SweetsColors.white,
                border: Border(
                  top: BorderSide(
                    color: SweetsColors.border.withOpacity(0.75),
                  ),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SweetsPrimaryButton(
                    label: 'Order another products',
                    onPressed: () {
                      // Navigate to home or explore
                      Navigator.of(context).pop();
                    },
                  ),
                  const SizedBox(height: Spacing.lg),
                  const SweetsHomeIndicator(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
