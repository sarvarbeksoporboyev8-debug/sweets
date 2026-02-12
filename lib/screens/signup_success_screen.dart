import 'package:flutter/material.dart';
import '../theme/sweets_theme.dart';
import '../widgets/sweets_navigation_bar.dart';
import '../widgets/sweets_button.dart';
import '../widgets/sweets_home_indicator.dart';

class SignupSuccessScreen extends StatelessWidget {
  const SignupSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFE6D1), // #ffe6d1
              Color(0xFFFFFFFF), // white at 55%
            ],
            stops: [0.0, 0.55],
          ),
        ),
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              // Navigation bar
              const SweetsNavigationBar(title: ''),
              // Main content - scrollable, no Spacer in unbounded context
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      const SizedBox(height: 80),
                      // Image (180x180)
                      SizedBox(
                        width: 180,
                        height: 180,
                        child: Image.asset(
                          'images/figma/987fec5e-0b7b-4569-a163-b77ca7dcdec2.png',
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(
                              Icons.check_circle,
                              size: 180,
                              color: SweetsColors.primary,
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 12),
                      // Title
                      Text(
                        'Get started now',
                        style: Theme.of(context).textTheme.headlineLarge,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      // Description
                      SizedBox(
                        width: 293,
                        child: Text(
                          'Go to the homepage and browse the products now.',
                          style: Theme.of(context).textTheme.bodyMedium,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 80),
                    ],
                  ),
                ),
              ),
              // Buttons - fixed at bottom
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SweetsPrimaryButton(
                      label: 'Get started',
                      onPressed: () {
                        // TODO: navigate to homepage
                      },
                    ),
                    const SizedBox(height: 8),
                    // Secondary button with border
                    SizedBox(
                      height: 56,
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                            color: SweetsColors.primary,
                            width: 1,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 14,
                          ),
                        ),
                        child: Text(
                          'Complete your profile ',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w500,
                                color: SweetsColors.primary,
                              ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SweetsHomeIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
