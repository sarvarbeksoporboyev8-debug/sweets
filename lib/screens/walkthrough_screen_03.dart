import 'package:flutter/material.dart';
import '../theme/sweets_theme.dart';
import '../constants/colors.dart';
import '../widgets/sweets_button.dart';
import '../widgets/sweets_home_indicator.dart';

class WalkthroughScreen03 extends StatelessWidget {
  const WalkthroughScreen03({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Exact sRGB background from Figma: #FFFFFF (Neutral/White/100)
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
            // Image container with gradient background
            Container(
              width: 396,
              height: 481,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                // Exact Figma radial gradient:
                // radial-gradient(73.99% 60.91% at 50% 39.09%, #FFE6D1 0%, #FD7E14 100%)
                gradient: const RadialGradient(
                  center: Alignment(0, -0.2182), // 39.09% from top in Flutter's -1..1 space
                  radius: 0.7399, // 73.99%
                  colors: [
                    SweetsColors.kTopBar,
                    Color(0xFFFD7E14),
                  ],
                  stops: [0.0, 1.0],
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 47.96,
                    bottom: 0,
                    child: SizedBox(
                      width: 300,
                      height: 368,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Image.asset('images/figma/69fc2101-2993-4adf-887b-b20d9f5447c1.png',
                              width: 299.929,
                              height: 607,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  width: 299.929,
                                  height: 607,
                                  color: Colors.grey[300],
                                );
                              },
                            ),
                          ),
                          Positioned(
                            left: 14.88,
                            top: 12.79,
                            child: Image.asset('images/figma/d7997b8b-c60a-41ef-ba55-45de9dcbecc6.png',
                              width: 268.092,
                              height: 579.179,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return const SizedBox.shrink();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            // Title
            SizedBox(
              width: 340,
              child: Text(
                'We offer excellent delivery service',
                style: Theme.of(context).textTheme.headlineLarge,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 12),
            // Description
            SizedBox(
              width: 388,
              child: Text(
                'Just choose your order and we will deliver it right away. We provide you with the best delivery service.',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 16),
            // Indicator dots
            SizedBox(
              width: 56,
              height: 8,
              child: Image.asset('images/figma/b068daf6-a245-493f-b78a-583a3de4263f.png',
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: SweetsColors.grayLighter,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: SweetsColors.grayLighter,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: SweetsColors.primary,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
            // Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const SweetsPrimaryButton(
                    label: 'Get started',
                    onPressed: null,
                  ),
                  const SizedBox(height: 8),
                  const SweetsSecondaryButton(
                    label: 'Next',
                    onPressed: null,
                  ),
                ],
              ),
            ),
            const SweetsHomeIndicator(),
          ],
        ),
      ),
    );
  }
}
