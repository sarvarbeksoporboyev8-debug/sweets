import 'package:flutter/material.dart';
import '../theme/sweets_theme.dart';
import '../constants/colors.dart';
import '../theme/spacing.dart';
import '../theme/responsive.dart';

/// Welcome splash screen that displays the app logo and welcome message.
/// Uses responsive design to adapt to different screen sizes.
class WelcomeSplashScreen extends StatelessWidget {
  const WelcomeSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final imageHeight = ResponsiveUtils.responsiveHeight(context, 0.5);

    return Scaffold(
      backgroundColor: SweetsColors.kCreamBg,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(flex: 2),
            
            // Hero image - dominates the screen
            Center(
              child: SizedBox(
                height: imageHeight,
                width: imageHeight,
                child: Image.asset(
                  'images/figma/82ca0a54-5f0a-4317-9813-533c1340e2d9.png',
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      decoration: BoxDecoration(
                        color: SweetsColors.primary,
                        borderRadius: BorderRadius.circular(imageHeight * 0.23),
                      ),
                      child: Icon(
                        Icons.cake,
                        size: imageHeight * 0.5,
                        color: SweetsColors.white,
                      ),
                    );
                  },
                ),
              ),
            ),

            SizedBox(height: Spacing.xxxl),

            // Welcome text
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Welcome to',
                    style: TextStyle(
                      fontFamily: 'Geist',
                      fontWeight: FontWeight.w400,
                      fontSize: ResponsiveUtils.responsiveFontSize(context, 0.018),
                      height: 1.43,
                      color: SweetsColors.gray,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: Spacing.sm),
                  Text(
                    'Sweets',
                    style: TextStyle(
                      fontFamily: 'Geist',
                      fontWeight: FontWeight.w500,
                      fontSize: ResponsiveUtils.responsiveFontSize(context, 0.05),
                      height: 1.0,
                      letterSpacing: -1.44,
                      color: SweetsColors.primaryDark,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            const Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
