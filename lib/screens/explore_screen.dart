import 'package:flutter/material.dart';
import '../theme/sweets_theme.dart';
import '../constants/colors.dart';
import '../constants/spacing.dart';
import '../constants/gradients.dart';
import '../widgets/explore/explore_top_bar.dart';
import '../widgets/explore/explore_product_card.dart';
import '../widgets/sweets_tab_bar.dart';

/// Explore / 01 – Explore sweets screen.
class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SweetsColors.white,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // White background with top bar
              Container(
                color: SweetsColors.white,
                child: const ExploreTopBar(),
              ),
              const _ExploreHeaderSection(),
              const SizedBox(height: Spacing.md),
              const _ExplorePromoGridSection(),
              const SizedBox(height: Spacing.md),
              const _BestProductsSection(),
              const SizedBox(height: Spacing.md),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SweetsTabBar(
        activeTab: 'Explore',
        onTabTap: (tab) {
          switch (tab) {
            case 'Home':
              Navigator.pushReplacementNamed(context, '/home');
              break;
            case 'Explore':
              // Already on explore, do nothing
              break;
            case 'Favorites':
              Navigator.pushReplacementNamed(context, '/favorites');
              break;
            case 'Cart':
              Navigator.pushReplacementNamed(context, '/cart');
              break;
            case 'Account':
              Navigator.pushReplacementNamed(context, '/account');
              break;
          }
        },
      ),
    );
  }
}

/// "Explore sweets" title under the search bar.
class _ExploreHeaderSection extends StatelessWidget {
  const _ExploreHeaderSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Explore sweets',
            style: TextStyle(
              fontFamily: 'Geist',
              fontWeight: FontWeight.w600,
              fontSize: 32,
              height: 1.0,
              letterSpacing: -0.96,
              color: SweetsColors.black,
            ),
          ),
        ],
      ),
    );
  }
}

/// Grid of promotional gradient cards under the "Explore sweets" title,
/// matching the 2x2 layout from the Figma Explore / 01 frame.
class _ExplorePromoGridSection extends StatelessWidget {
  const _ExplorePromoGridSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.md),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final cardWidth = (constraints.maxWidth - Spacing.spacing12) / 2;

          // 2-column masonry layout without Transform.translate
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    SizedBox(
                      width: cardWidth,
                      child: const _PromoCard(
                        title: 'Delicious\ncupcake',
                        imagePath: 'assets/images/promo_cupcake.png',
                        height: 173,
                      ),
                    ),
                    const SizedBox(height: Spacing.spacing12),
                    SizedBox(
                      width: cardWidth,
                      child: const _PromoCard(
                        title: 'Delicious\ndonuts for you',
                        imagePath: 'assets/images/promo_donuts.png',
                        height: 173,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: Spacing.spacing12),
              Expanded(
                child: Column(
                  children: [
                    SizedBox(
                      width: cardWidth,
                      child: const _PromoCard(
                        title: 'The most\ndelicious and\ntasty desserts.',
                        imagePath: 'assets/images/promo_desserts.png',
                        height: 173,
                      ),
                    ),
                    const SizedBox(height: Spacing.spacing12),
                    SizedBox(
                      width: cardWidth,
                      child: const _PromoCard(
                        title: 'Delicious\nFruit cake',
                        imagePath: 'assets/images/promo_fruit_cake.png',
                        height: 173,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _PromoCard extends StatelessWidget {
  const _PromoCard({
    required this.title,
    required this.imagePath,
    this.height = 200,
  });

  final String title;
  final String imagePath;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Spacing.spacing20),
        gradient: SweetsGradients.promoBanner, // Cyan gradient for promo banner
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(Spacing.md),
            child: Text(
              title,
              style: const TextStyle(
                fontFamily: 'Geist',
                fontWeight: FontWeight.w600,
                fontSize: 24,
                height: 24 / 24,
                letterSpacing: -0.72,
                color: SweetsColors.textDark, // Dark text on pastel cyan
              ),
            ),
          ),
          Positioned(
            right: -8,
            bottom: -8,
            child: Image.asset(
              imagePath,
              width: 140,
              height: 140,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _BestProductsSection extends StatelessWidget {
  const _BestProductsSection();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Best Products',
                style: TextStyle(
                  fontFamily: 'Geist',
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  height: 1.0,
                  letterSpacing: -0.36,
                  color: SweetsColors.black,
                ),
              ),
              Text(
                'View more',
                style: theme.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: SweetsColors.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: Spacing.md),
          LayoutBuilder(
            builder: (context, constraints) {
              final cardWidth = (constraints.maxWidth - Spacing.spacing12) / 2;
              
              return Wrap(
                spacing: Spacing.spacing12,
                runSpacing: Spacing.spacing12,
                children: [
                  SizedBox(
                    width: cardWidth,
                    child: const ExploreProductCard(
                      title: 'Fruits tart',
                      category: 'Tarts',
                      price: '\$15.55',
                      discountLabel: '-50%',
                      colorIndex: 0, // Purple
                    ),
                  ),
                  SizedBox(
                    width: cardWidth,
                    child: const ExploreProductCard(
                      title: 'Fruit tart',
                      category: 'Tarts',
                      price: '\$15.55',
                      discountLabel: '-60%',
                      colorIndex: 1, // Cyan
                    ),
                  ),
                  SizedBox(
                    width: cardWidth,
                    child: const ExploreProductCard(
                      title: 'Apple tart',
                      category: 'Tarts',
                      price: '\$15.55',
                      discountLabel: '-50%',
                      colorIndex: 2, // Peach
                    ),
                  ),
                  SizedBox(
                    width: cardWidth,
                    child: const ExploreProductCard(
                      title: 'Cupcakes',
                      category: 'Cupcake',
                      price: '\$15.55',
                      discountLabel: '-50%',
                      colorIndex: 3, // Yellow
                    ),
                  ),
                  SizedBox(
                    width: cardWidth,
                    child: const ExploreProductCard(
                      title: 'Donuts',
                      category: 'Donuts',
                      price: '\$15.55',
                      discountLabel: '-50%',
                      colorIndex: 0, // Purple (rotation)
                    ),
                  ),
                  SizedBox(
                    width: cardWidth,
                    child: const ExploreProductCard(
                      title: 'Berry pie',
                      category: 'Pies',
                      price: '\$15.55',
                      discountLabel: '-50%',
                      colorIndex: 1, // Cyan
                    ),
                  ),
                  SizedBox(
                    width: cardWidth,
                    child: const ExploreProductCard(
                      title: 'Macarons',
                      category: 'Macarons',
                      price: '\$15.55',
                      discountLabel: '-50%',
                      colorIndex: 2, // Peach
                    ),
                  ),
                  SizedBox(
                    width: cardWidth,
                    child: const ExploreProductCard(
                      title: 'Fruits cake',
                      category: 'Cake',
                      price: '\$15.55',
                      discountLabel: '-50%',
                      colorIndex: 3, // Yellow
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
