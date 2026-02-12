import 'package:flutter/material.dart';
import '../theme/sweets_theme.dart';
import '../widgets/sweets_home_indicator.dart';
import '../constants/spacing.dart';
import '../constants/gradients.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SweetsColors.white,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // Navigation
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
                    'About us',
                    style: TextStyle(
                      fontFamily: 'Geist',
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      height: 20 / 14,
                      color: SweetsColors.grayDarker,
                    ),
                  ),
                ],
              ),
            ),
            // Hero section
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(Spacing.radiusXl),
                bottomRight: Radius.circular(Spacing.radiusXl),
              ),
              child: Container(
                width: double.infinity,
                height: 480,
                padding: const EdgeInsets.fromLTRB(64, 112, 64, 0),
                decoration: const BoxDecoration(
                  gradient: AppGradients.heroGradient,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 300,
                      height: 368,
                      child: Stack(
                        children: [
                          // Phone screen background
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Image.asset(
                              'images/figma/d3865684-bb75-4836-91f8-0b60ea5df56b.png',
                              width: 300,
                              height: 607,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  width: 300,
                                  height: 607,
                                  color: SweetsColors.grayLighter,
                                );
                              },
                            ),
                          ),
                          // Phone frame overlay
                          Positioned(
                            left: 14.88,
                            top: 12.79,
                            child: Image.asset(
                              'images/figma/d2375e42-77dd-44a0-b887-dc373c32fc1d.png',
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
                  ],
                ),
              ),
            ),
            // Content section
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(
                  Spacing.lg,
                  Spacing.sectionSpacing,
                  Spacing.lg,
                  100,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Who we are ?',
                      style: TextStyle(
                        fontFamily: 'Geist',
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                        height: 24 / 24,
                        letterSpacing: -0.72,
                        color: SweetsColors.black,
                      ),
                    ),
                    const SizedBox(height: Spacing.md),
                    const Text(
                      'Sweets is a delivery app for sweets and products from home-based businesses, providing sales outlets for these businesses, allowing merchants to have a complete dashboard of their store.',
                      style: TextStyle(
                        fontFamily: 'Geist',
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        height: 24 / 16,
                        color: SweetsColors.grayDark,
                      ),
                    ),
                    const SizedBox(height: Spacing.xxxl),
                    const Text(
                      'What makes Sweets special?',
                      style: TextStyle(
                        fontFamily: 'Geist',
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                        height: 24 / 24,
                        letterSpacing: -0.72,
                        color: SweetsColors.black,
                      ),
                    ),
                    const SizedBox(height: Spacing.md),
                    const Text(
                      'What sets The Sweet apart is its professional project design and the provision of a dashboard for merchants through the app, enabling them to add products and delivery personnel and manage their entire store.',
                      style: TextStyle(
                        fontFamily: 'Geist',
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        height: 24 / 16,
                        color: SweetsColors.grayDark,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SweetsHomeIndicator(),
          ],
        ),
      ),
    );
  }
}
