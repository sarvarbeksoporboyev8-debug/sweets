import 'package:flutter/material.dart';
import '../theme/sweets_theme.dart';
import '../widgets/sweets_navigation_bar.dart';
import '../widgets/sweets_button.dart';
import '../widgets/sweets_home_indicator.dart';

class LoginSuccessScreen extends StatelessWidget {
  const LoginSuccessScreen({super.key});

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
              const SweetsNavigationBar(title: 'Login'),
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
                          'images/figma/8391d07c-2f01-4c22-a677-05731c7713b0.png',
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
                        'Welcome! 👋',
                        style: Theme.of(context).textTheme.headlineLarge,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      // Description
                      SizedBox(
                        width: 303,
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
              // Button - fixed at bottom
              const Padding(
                padding: EdgeInsets.all(16),
                child: SweetsPrimaryButton(
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
