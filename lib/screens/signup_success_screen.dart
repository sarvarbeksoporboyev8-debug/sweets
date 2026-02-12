import 'package:flutter/material.dart';
import '../theme/sweets_theme.dart';
import '../theme/spacing.dart';
import '../theme/gradients.dart';
import '../widgets/sweets_navigation_bar.dart';
import '../widgets/sweets_button.dart';
import '../widgets/sweets_home_indicator.dart';
import '../widgets/auth/success_message.dart';

/// Signup success screen that displays a success message after signup.
/// Provides options to get started or complete profile.
class SignupSuccessScreen extends StatelessWidget {
  const SignupSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: SweetsGradients.successBackground,
        ),
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              const SweetsNavigationBar(title: ''),
              
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: Spacing.lg),
                  child: Column(
                    children: [
                      SizedBox(height: Spacing.gapLg),
                      
                      const SuccessMessage(
                        imagePath: 'images/figma/987fec5e-0b7b-4569-a163-b77ca7dcdec2.png',
                        title: 'Get started now',
                        description: 'Go to the homepage and browse the products now.',
                      ),
                      
                      SizedBox(height: Spacing.gapLg),
                    ],
                  ),
                ),
              ),
              
              Padding(
                padding: EdgeInsets.all(Spacing.lg),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SweetsPrimaryButton(
                      label: 'Get started',
                      onPressed: () {
                        // TODO: navigate to homepage
                      },
                    ),
                    SizedBox(height: Spacing.sm),
                    
                    SizedBox(
                      height: Spacing.buttonHeight,
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {
                          // TODO: navigate to complete profile
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                            color: SweetsColors.primary,
                            width: 1,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(Spacing.lg),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: Spacing.xl,
                            vertical: Spacing.buttonPadding,
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
