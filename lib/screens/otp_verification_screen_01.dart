import 'package:flutter/material.dart';
import '../theme/sweets_theme.dart';
import '../constants/colors.dart';
import '../widgets/sweets_navigation_bar.dart';
import '../widgets/sweets_otp_field.dart';
import '../widgets/sweets_home_indicator.dart';

class OtpVerificationScreen01 extends StatelessWidget {
  const OtpVerificationScreen01({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SweetsColors.white,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // Navigation bar
            const SweetsNavigationBar(title: 'OTP'),
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
                        width: 300,
                        height: 300,
                        child: Image.asset(
                          'images/figma/56b2db5a-fd58-4a7a-bd89-c9e2d2d586e6.png',
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(
                              Icons.verified_user,
                              size: 300,
                              color: SweetsColors.primary,
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 24),
                      // Text
                      SizedBox(
                        width: 396,
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: Theme.of(context).textTheme.bodyMedium,
                            children: const [
                              TextSpan(text: 'The verification code has been sent to the number\n'),
                              TextSpan(
                                text: '+96 6901 ****** 01',
                                style: TextStyle(
                                  fontFamily: 'Geist',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  height: 24 / 16,
                                  color: SweetsColors.grayDarker,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      // OTP Inputs
                      const SweetsOtpField(),
                      const SizedBox(height: 16),
                      // Resend link
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Resend',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w500,
                                color: SweetsColors.primary,
                              ),
                          textAlign: TextAlign.center,
                        ),
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
                  // Disabled button
                  SizedBox(
                    height: 56,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: SweetsColors.kAccentGold,
                        foregroundColor: SweetsColors.white75,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                      ),
                      child: const Text(
                        'Verify',
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
