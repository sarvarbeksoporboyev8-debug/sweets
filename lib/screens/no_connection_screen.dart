import 'package:flutter/material.dart';
import '../theme/sweets_theme.dart';
import '../widgets/sweets_home_indicator.dart';
import '../widgets/sweets_button.dart';

class NoConnectionScreen extends StatelessWidget {
  const NoConnectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SweetsColors.white,
      body: Stack(
        children: [
          // Empty state content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 270,
                  height: 270,
                  child: Image.asset('images/figma/c951e197-ca5f-442c-a93a-f29dcbed1088.png',
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
                          Icons.wifi_off,
                          size: 80,
                          color: SweetsColors.gray,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'There is a problem.',
                  style: TextStyle(
                    fontFamily: 'Geist',
                    fontWeight: FontWeight.w600,
                    fontSize: 32,
                    height: 1.0,
                    letterSpacing: -0.96,
                    color: SweetsColors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: 300,
                  child: const Text(
                    'Unfortunately, the internet connection could not be established. Please check, thank you.',
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
          // Bottom button and home indicator
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: SizedBox(
                    height: 56,
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // TODO: Retry connection
                      },
                      icon: const Icon(
                        Icons.refresh,
                        size: 24,
                        color: SweetsColors.white,
                      ),
                      label: const Text(
                        'Try again',
                        style: TextStyle(
                          fontFamily: 'Geist',
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          height: 24 / 16,
                          color: SweetsColors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: SweetsColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                      ),
                    ),
                  ),
                ),
                const SweetsHomeIndicator(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
