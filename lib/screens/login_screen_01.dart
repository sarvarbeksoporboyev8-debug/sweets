import 'package:flutter/material.dart';
import '../theme/sweets_theme.dart';
import '../constants/colors.dart';
import '../widgets/sweets_navigation_bar.dart';
import '../widgets/sweets_fields.dart';
import '../widgets/sweets_home_indicator.dart';

class LoginScreen01 extends StatelessWidget {
  const LoginScreen01({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SweetsColors.white,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // Navigation bar flows naturally at the top
            const SweetsNavigationBar(title: 'Login'),
            // Main content - scrollable and centered without hardcoded top math
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 40),
                      // Image (152x152)
                      SizedBox(
                        width: 152,
                        height: 152,
                        child: Image.asset(
                          'images/figma/72126bc3-3071-44fb-9046-b9422611b976.png',
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(
                              Icons.person,
                              size: 152,
                              color: SweetsColors.primary,
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 12),
                      // Title
                      Text(
                        'Welcome back! 👋',
                        style: Theme.of(context).textTheme.headlineLarge,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      // Subtitle
                      Text(
                        'Log in to your account.',
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      // Phone number field
                      const SweetsPhoneNumberField(
                        label: 'Phone number',
                        hint: 'Add phone number',
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ),
            // Bottom section - fixed at the bottom
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Disabled button with lighter orange
                  SizedBox(
                    height: 56,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: SweetsColors.primaryLighter,
                        foregroundColor: const Color(0xBFFFFFFF), // rgba(255,255,255,0.75)
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 14,
                        ),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontFamily: 'Geist',
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          height: 24 / 16,
                          letterSpacing: 0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12), // gap-[12px] not 16
                  // Create account link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Create a new account',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w500,
                                color: SweetsColors.primary,
                              ),
                        ),
                      ),
                    ],
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
