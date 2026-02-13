import 'package:flutter/material.dart';
import '../theme/sweets_theme.dart';
import '../constants/colors.dart';
import '../widgets/sweets_home_indicator.dart';
import '../widgets/sweets_button.dart';
import '../widgets/checkout/success_message.dart';

class CheckoutSuccessScreen extends StatelessWidget {
  const CheckoutSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SweetsColors.kCreamBg,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              SweetsColors.kTopBar,
              Color(0xFFFFFFFF),
            ],
            stops: [0.0, 0.3],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const Expanded(
                child: Center(
                  child: SuccessMessage(
                    title: 'Congratulations',
                    message:
                        'Payment has been successfully confirmed. You can now track your order.',
                    imageAsset:
                        'images/figma/71dd6ccd-f2e4-4681-bcc4-ccd022c95b10.png',
                  ),
                ),
              ),
              Container(
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
                      label: 'Track your order',
                      onPressed: () {
                        // TODO: Navigate to order tracking
                      },
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 56,
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {
                          // TODO: Navigate to homepage
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor: SweetsColors.primary,
                          side: const BorderSide(color: SweetsColors.primary),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 14,
                          ),
                        ),
                        child: const Text(
                          'Go to the homepage',
                          style: TextStyle(
                            fontFamily: 'Geist',
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            height: 24 / 16,
                            color: SweetsColors.primary,
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
        ),
      ),
    );
  }
}
