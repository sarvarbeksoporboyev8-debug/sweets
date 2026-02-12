import 'package:flutter/material.dart';
import '../theme/sweets_theme.dart';

class WelcomeSplashScreen extends StatelessWidget {
  const WelcomeSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final imageHeight = screenHeight * 0.5; // 50% of screen height for hero image

    return Scaffold(
      backgroundColor: SweetsColors.white,
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
                width: imageHeight, // Square aspect ratio
                child: Image.asset(
                  'images/figma/82ca0a54-5f0a-4317-9813-533c1340e2d9.png',
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    // Fallback: orange squircle with white cupcake icon
                    return Container(
                      decoration: BoxDecoration(
                        color: SweetsColors.primary,
                        borderRadius: BorderRadius.circular(imageHeight * 0.23), // Squircle shape
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

            SizedBox(height: screenHeight * 0.04), // Responsive spacing

            // Text - secondary to the image
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
                    fontSize: screenHeight * 0.018, // Responsive font size
                    height: 1.43,
                    color: const Color(0xFF868E96),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.008),
                Text(
                  'Sweets',
                  style: TextStyle(
                    fontFamily: 'Geist',
                    fontWeight: FontWeight.w500,
                    fontSize: screenHeight * 0.05, // Responsive font size
                    height: 1.0,
                    letterSpacing: -1.44,
                    color: const Color(0xFFF76707),
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
