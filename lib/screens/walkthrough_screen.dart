import 'package:flutter/material.dart';
import '../theme/sweets_theme.dart';
import '../constants/colors.dart';
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
      frameImagePath: 'images/figma/8a0b5533-d79c-455f-8408-d4d8cc2e8a44.png',
      screenImagePath: 'images/figma/5f69178a-5040-4ee5-b88b-59602e8c56b5.png',
      title: 'Welcome to Sweets 🍰',
      description: 'Discover a new way to order cakes, candies, desserts, and sweets delivered to your door.',
    ),
    WalkthroughPage(
      frameImagePath: 'images/figma/b5d6cff7-5424-491b-8b9c-30f375135b73.png',
      screenImagePath: 'images/figma/fcaf9cd2-e6b3-4313-bc4a-48777a84a633.png',
      title: 'Discover the most delicious sweets',
      description: 'Explore the catalog of delectable sweets, desserts, chocolates, and more. Search for new flavors.',
    ),
    WalkthroughPage(
      frameImagePath: 'images/figma/69fc2101-2993-4adf-887b-b20d9f5447c1.png',
      screenImagePath: 'images/figma/d7997b8b-c60a-41ef-ba55-45de9dcbecc6.png',
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

  const _WalkthroughPageWidget({
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        // Image container with gradient background
        Container(
          width: 396,
          height: 481,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            // Exact Figma radial gradient:
            // radial-gradient(73.99% 60.91% at 50% 39.09%, #FFE6D1 0%, #FD7E14 100%)
            gradient: const RadialGradient(
              center: Alignment(0, -0.2182), // 39.09% from top in Flutter's -1..1 space
              radius: 0.7399, // 73.99%
              colors: [
                SweetsColors.kTopBar,
                SweetsColors.kCardBeige3,
              ],
              stops: [0.0, 1.0],
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 47.96,
                bottom: 0,
                child: SizedBox(
                  width: 300,
                  height: 368,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Image.asset(
                          page.frameImagePath,
                          width: 300,
                          height: 607,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: 300,
                              height: 607,
                              color: Colors.grey[300],
                            );
                          },
                        ),
                      ),
                      Positioned(
                        left: 14.88,
                        top: 12.79,
                        child: Image.asset(
                          page.screenImagePath,
                          width: 268.155,
                          height: 579.315,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const SizedBox.shrink();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        // Title
        Text(
          page.title,
          style: Theme.of(context).textTheme.headlineLarge,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),
        // Description
        SizedBox(
          width: 388,
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
  final String frameImagePath;
  final String screenImagePath;
  final String title;
  final String description;

  const WalkthroughPage({
    required this.frameImagePath,
    required this.screenImagePath,
    required this.title,
    required this.description,
  });
}
