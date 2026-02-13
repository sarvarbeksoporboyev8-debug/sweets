import 'package:flutter/material.dart';
import '../theme/sweets_theme.dart';
import '../constants/colors.dart';
import '../widgets/sweets_navigation_bar.dart';
import '../widgets/sweets_button.dart';
import '../widgets/sweets_fields.dart';
import '../widgets/sweets_alert.dart';
import '../widgets/sweets_home_indicator.dart';

class SignupScreen03 extends StatelessWidget {
  const SignupScreen03({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SweetsColors.white,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // Navigation bar
            const SweetsNavigationBar(title: 'Signup'),
            // Error alert - naturally flows after navbar
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: SweetsErrorAlert(
                message: 'The phone number already exists, try to login to your account.',
              ),
            ),
            // Main content - centered with natural spacing
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 40),
                      // Image
                      SizedBox(
                        width: 152,
                        height: 152,
                        child: Image.asset(
                          'images/figma/6d8ec6e1-2caf-4c71-a6fa-ac5c86457d2d.png',
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(
                              Icons.person_add,
                              size: 152,
                              color: SweetsColors.primary,
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 12),
                      // Title
                      Text(
                        'Create your account 😊',
                        style: Theme.of(context).textTheme.headlineLarge,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      // Subtitle
                      SizedBox(
                        width: 346,
                        child: Text(
                          'Create a new account and get ready for a new adventure now.',
                          style: Theme.of(context).textTheme.bodyMedium,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 12),
                      // Phone number field with value
                      const SweetsPhoneNumberField(
                        label: 'Phone number',
                        hint: '3 5665 25699',
                        value: '3 5665 25699',
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ),
            // Bottom section - fixed at bottom
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SweetsPrimaryButton(
                    label: 'New Account',
                    onPressed: () {
                      // TODO: hook up navigation for successful signup
                    },
                  ),
                  const SizedBox(height: 16),
                  // Login link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Log in to your account',
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
