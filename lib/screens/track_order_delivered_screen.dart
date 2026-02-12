import 'package:flutter/material.dart';
import '../theme/sweets_theme.dart';
import '../widgets/sweets_home_indicator.dart';
import '../widgets/sweets_button.dart';

class TrackOrderDeliveredScreen extends StatelessWidget {
  const TrackOrderDeliveredScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SweetsColors.white,
      body: Stack(
        children: [
          // Navigation bar
          Positioned(
            left: 0,
            right: 0,
            top: 44,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              color: SweetsColors.white,
              child: const Row(
                children: [
                  Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 20,
                    color: SweetsColors.grayDarker,
                  ),
                  SizedBox(width: 8),
                  Text(
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
          ),
          // Main content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 270,
                  height: 270,
                  child: Image.asset('images/figma/218dd5f2-15c0-4451-ba36-77383bad6442.png',
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 270,
                        height: 270,
                        decoration: BoxDecoration(
                          color: SweetsColors.grayLighter,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: const Icon(
                          Icons.check_circle,
                          size: 80,
                          color: SweetsColors.primary,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Congratulations',
                  style: TextStyle(
                    fontFamily: 'Geist',
                    fontWeight: FontWeight.w600,
                    fontSize: 32,
                    height: 1.0,
                    letterSpacing: -0.96,
                    color: SweetsColors.black,
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: 286,
                  child: const Text(
                    'You\'re product has been delivered successfully.',
                    style: TextStyle(
                      fontFamily: 'Geist',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      height: 24 / 16,
                      color: SweetsColors.grayDark,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          // Bottom button
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.all(16),
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
                      // TODO: Navigate to home or explore
                    },
                  ),
                  const SizedBox(height: 16),
                  const SweetsHomeIndicator(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
