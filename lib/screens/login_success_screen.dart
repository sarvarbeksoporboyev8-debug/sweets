import 'package:flutter/material.dart';
import '../theme/sweets_theme.dart';
import '../theme/spacing.dart';
import '../theme/gradients.dart';
import '../widgets/sweets_navigation_bar.dart';
import '../widgets/sweets_button.dart';
import '../widgets/sweets_home_indicator.dart';
import '../widgets/auth/success_message.dart';

/// Login success screen that displays a success message after login.
/// Uses responsive layout and reusable success message component.
class LoginSuccessScreen extends StatelessWidget {
  const LoginSuccessScreen({super.key});

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
              const SweetsNavigationBar(title: 'Login'),
              
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: Spacing.lg),
                  child: Column(
                    children: [
                      SizedBox(height: Spacing.gapLg),
                      
                      const SuccessMessage(
                        imagePath: 'images/figma/8391d07c-2f01-4c22-a677-05731c7713b0.png',
                        title: 'Welcome! 👋',
                        description: 'Go to the homepage and browse the products now.',
                      ),
                      
                      SizedBox(height: Spacing.gapLg),
                    ],
                  ),
                ),
              ),
              
              Padding(
                padding: EdgeInsets.all(Spacing.lg),
                child: const SweetsPrimaryButton(
                  label: 'Get started',
                  onPressed: null,
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
