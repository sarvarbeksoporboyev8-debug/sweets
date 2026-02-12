import 'package:flutter/material.dart';
import '../theme/sweets_theme.dart';
import '../constants/spacing.dart';
import '../widgets/sweets_button.dart';
import '../widgets/sweets_home_indicator.dart';

/// Unified walkthrough screen with state management for different pages.
/// Replaces WalkthroughScreen01-03 with PageView-based navigation.
class WalkthroughScreen extends StatefulWidget {
  const WalkthroughScreen({super.key});

  @override
  State<WalkthroughScreen> createState() => _WalkthroughScreenState();
}

class _WalkthroughScreenState extends State<WalkthroughScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<WalkthroughPage> _pages = const [
    WalkthroughPage(
      imagePath: 'images/figma/8a0b5533-d79c-455f-8408-d4d8cc2e8a44.png',
      title: 'Welcome to Sweets 🍰',
      description: 'Discover a new way to order cakes, candies, desserts, and sweets delivered to your door.',
    ),
    WalkthroughPage(
      imagePath: 'images/figma/b5d6cff7-5424-491b-8b9c-30f375135b73.png',
      title: 'Discover the most delicious sweets',
      description: 'Explore the catalog of delectable sweets, desserts, chocolates, and more. Search for new flavors.',
    ),
    WalkthroughPage(
      imagePath: 'images/figma/3be11e8f-b3e6-47b9-851a-d83d4c54f0e7.png',
      title: 'Fast delivery to your doorstep',
      description: 'Get desserts and sweets delivered quickly to your location. Track your order in real-time.',
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  void _handleNext() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Navigate to login/signup
      // Navigator.pushReplacementNamed(context, '/login');
    }
  }

  void _handleSkip() {
    // Navigate to login/signup
    // Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final imageHeight = screenHeight * 0.5; // 50% of screen height

    return Scaffold(
      backgroundColor: SweetsColors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Skip button
            if (_currentPage < _pages.length - 1)
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(SweetsSpacing.padding),
                  child: TextButton(
                    onPressed: _handleSkip,
                    child: Text(
                      'Skip',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: SweetsColors.gray,
                          ),
                    ),
                  ),
                ),
              )
            else
              const SizedBox(height: SweetsSpacing.huge),
            
            // Page content
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemCount: _pages.length,
                itemBuilder: (context, index) {
                  return _WalkthroughPageWidget(
                    page: _pages[index],
                    imageHeight: imageHeight,
                  );
                },
              ),
            ),
            
            // Page indicators
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_pages.length, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: _currentPage == index ? 24 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: _currentPage == index
                        ? SweetsColors.primary
                        : SweetsColors.grayLighter,
                    borderRadius: BorderRadius.circular(4),
                  ),
                );
              }),
            ),
            const SizedBox(height: SweetsSpacing.paddingLarge),
            
            // Next/Get Started button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: SweetsSpacing.padding),
              child: SweetsPrimaryButton(
                label: _currentPage < _pages.length - 1 ? 'Next' : "Let's get started",
                onPressed: _handleNext,
              ),
            ),
            const SizedBox(height: SweetsSpacing.padding),
            const SweetsHomeIndicator(),
          ],
        ),
      ),
    );
  }
}

/// Individual walkthrough page widget
class _WalkthroughPageWidget extends StatelessWidget {
  final WalkthroughPage page;
  final double imageHeight;

  const _WalkthroughPageWidget({
    required this.page,
    required this.imageHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Image with gradient background
        Container(
          height: imageHeight,
          margin: const EdgeInsets.symmetric(horizontal: SweetsSpacing.padding),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(SweetsSpacing.radiusXLarge),
            gradient: const RadialGradient(
              center: Alignment(0, -0.2),
              radius: 0.74,
              colors: [
                Color(0xFFFFE6D1),
                Color(0xFFFD7E14),
              ],
            ),
          ),
          child: Center(
            child: Image.asset(
              page.imagePath,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.cake,
                  size: 200,
                  color: SweetsColors.white,
                );
              },
            ),
          ),
        ),
        const SizedBox(height: SweetsSpacing.xxxl),
        
        // Title
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: SweetsSpacing.paddingLarge),
          child: Text(
            page.title,
            style: Theme.of(context).textTheme.headlineLarge,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: SweetsSpacing.gap),
        
        // Description
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: SweetsSpacing.paddingLarge),
          child: Text(
            page.description,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

/// Model for walkthrough page data
class WalkthroughPage {
  final String imagePath;
  final String title;
  final String description;

  const WalkthroughPage({
    required this.imagePath,
    required this.title,
    required this.description,
  });
}
