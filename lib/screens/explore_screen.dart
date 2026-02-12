import 'package:flutter/material.dart';
import '../theme/sweets_theme.dart';
import '../widgets/sweets_home_indicator.dart';

/// Explore / 01 – Explore sweets screen.
class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SweetsColors.white,
      body: Stack(
        children: [
          // Scrollable content area
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Gradient background with top bar
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFFFFE6D1),
                          Color(0xFFFFFFFF),
                        ],
                      ),
                    ),
                    child: const _ExploreTopBar(),
                  ),
                  const _ExploreHeaderSection(),
                  const SizedBox(height: 16),
                  const _ExplorePromoGridSection(),
                  const SizedBox(height: 16),
                  const _ExploreBannerCard(),
                  const SizedBox(height: 16),
                  const _BestProductsSection(),
                ],
              ),
            ),
          ),
          const _ExploreTabBar(),
        ],
      ),
    );
  }
}

class _ExploreTopBar extends StatelessWidget {
  const _ExploreTopBar();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 44, left: 16, right: 16, bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: Image.asset(
                          'assets/images/profile_avatar.png',
                          width: 36,
                          height: 36,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: 36,
                              height: 36,
                              decoration: const BoxDecoration(
                                color: SweetsColors.grayLighter,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.person,
                                size: 20,
                                color: SweetsColors.gray,
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome 👋',
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: SweetsColors.gray,
                            ),
                          ),
                          const SizedBox(height: 2),
                          const Text(
                            'John Smith',
                            style: TextStyle(
                              fontFamily: 'Geist',
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              height: 1.0,
                              letterSpacing: -0.32,
                              color: SweetsColors.grayDarker,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      _CircleIconButton(icon: Icons.more_horiz),
                      SizedBox(width: 8),
                      Stack(
                        children: [
                          _CircleIconButton(icon: Icons.notifications_none),
                          Positioned(
                            right: 8,
                            top: 8,
                            child: CircleAvatar(
                              radius: 5,
                              backgroundColor: SweetsColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                decoration: BoxDecoration(
                  color: SweetsColors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: SweetsColors.border),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.search,
                      size: 20,
                      color: SweetsColors.gray,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Search',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: SweetsColors.gray,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
  }
}

class _CircleIconButton extends StatelessWidget {
  const _CircleIconButton({required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: SweetsColors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Icon(
        icon,
        size: 20,
        color: SweetsColors.grayDarker,
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
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
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
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final cardWidth = (constraints.maxWidth - 12) / 2;

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
                        height: 247,
                      ),
                    ),
                    const SizedBox(height: 12),
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
              const SizedBox(width: 12),
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
                    const SizedBox(height: 12),
                    SizedBox(
                      width: cardWidth,
                      child: const _PromoCard(
                        title: 'Delicious\nFruit cake',
                        imagePath: 'assets/images/promo_fruit_cake.png',
                        height: 247,
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
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFFFA94D),
            Color(0xFFFF7808),
          ],
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              title,
              style: const TextStyle(
                fontFamily: 'Geist',
                fontWeight: FontWeight.w600,
                fontSize: 24,
                height: 24 / 24,
                letterSpacing: -0.72,
                color: SweetsColors.white,
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

/// Bottom Categories block (headline + pills) that sits after Best Products,
/// like in the Figma Explore / 01 frame.
class _ExploreBottomCategoriesSection extends StatelessWidget {
  const _ExploreBottomCategoriesSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Categories',
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
                style: TextStyle(
                  fontFamily: 'Geist',
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  height: 20 / 14,
                  color: SweetsColors.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: const [
                _ExploreCategoryPill(
                  label: 'Chocolate',
                  imagePath: 'assets/images/category_chocolate.png',
                ),
                _ExploreCategoryPill(
                  label: 'Croissant',
                  imagePath: 'assets/images/category_croissant.png',
                ),
                _ExploreCategoryPill(
                  label: 'Donuts',
                  imagePath: 'assets/images/category_donuts.png',
                ),
                _ExploreCategoryPill(
                  label: 'Tarts',
                  imagePath: 'assets/images/category_tarts.png',
                ),
                _ExploreCategoryPill(
                  label: 'Pies',
                  imagePath: 'assets/images/category_pies.png',
                ),
                _ExploreCategoryPill(
                  label: 'Macarons',
                  imagePath: 'assets/images/category_macarons.png',
                ),
                _ExploreCategoryPill(
                  label: 'Cookies',
                  imagePath: 'assets/images/category_cookies.png',
                ),
                _ExploreCategoryPill(
                  label: 'Pancake',
                  imagePath: 'assets/images/category_pancake.png',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ExploreCategoryPill extends StatelessWidget {
  const _ExploreCategoryPill({
    required this.label,
    required this.imagePath,
  });

  final String label;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Column(
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: const Color(0xFFFFDEBB),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Image.asset(
                imagePath,
                width: 56,
                height: 56,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.local_cafe,
                    size: 32,
                    color: SweetsColors.primary,
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              fontFamily: 'Geist',
              fontWeight: FontWeight.w400,
              fontSize: 12,
              height: 16 / 12,
              color: SweetsColors.grayDarker,
            ),
          ),
        ],
      ),
    );
  }
}

class _ExploreBannerCard extends StatelessWidget {
  const _ExploreBannerCard();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        height: 240,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFFFA94D),
                  Color(0xFFFF7808),
                ],
              ),
            ),
        child: Stack(
          children: [
            Positioned(
              left: 79,
              top: 32,
              child: Image.asset(
                'assets/images/banner_strawberry_cake.png',
                width: 354,
                height: 184,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return const SizedBox.shrink();
                },
              ),
            ),
            Positioned(
              left: 24,
              top: 24,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Fruit Cake',
                    style: TextStyle(
                      fontFamily: 'Geist',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      height: 20 / 14,
                      color: SweetsColors.white,
                    ),
                  ),
                  SizedBox(height: 4),
                  SizedBox(
                    width: 205,
                    child: Text(
                      'Strawberry Cake',
                      style: TextStyle(
                        fontFamily: 'Geist',
                        fontWeight: FontWeight.w600,
                        fontSize: 32,
                        height: 32 / 32,
                        letterSpacing: -0.96,
                        color: SweetsColors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 24,
              bottom: 24,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                decoration: BoxDecoration(
                  color: SweetsColors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Text(
                  'Add to cart',
                  style: TextStyle(
                    fontFamily: 'Geist',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    height: 24 / 16,
                    color: SweetsColors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
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
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final cardWidth = (constraints.maxWidth - 12) / 2;

          return Column(
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
              const SizedBox(height: 16),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  SizedBox(
                    width: cardWidth,
                    child: const _ProductCard(
                      title: 'Fruits tart',
                      category: 'Tarts',
                      price: '\$15.55',
                      discountLabel: '-50%',
                    ),
                  ),
                  SizedBox(
                    width: cardWidth,
                    child: const _ProductCard(
                      title: 'Fruit tart',
                      category: 'Tarts',
                      price: '\$15.55',
                      discountLabel: '-60%',
                    ),
                  ),
                  SizedBox(
                    width: cardWidth,
                    child: const _ProductCard(
                      title: 'Apple tart',
                      category: 'Tarts',
                      price: '\$15.55',
                      discountLabel: '-50%',
                    ),
                  ),
                  SizedBox(
                    width: cardWidth,
                    child: const _ProductCard(
                      title: 'Cupcakes',
                      category: 'Cupcake',
                      price: '\$15.55',
                      discountLabel: '-50%',
                    ),
                  ),
                  SizedBox(
                    width: cardWidth,
                    child: const _ProductCard(
                      title: 'Donuts',
                      category: 'Donuts',
                      price: '\$15.55',
                      discountLabel: '-50%',
                    ),
                  ),
                  SizedBox(
                    width: cardWidth,
                    child: const _ProductCard(
                      title: 'Berry pie',
                      category: 'Pies',
                      price: '\$15.55',
                      discountLabel: '-50%',
                    ),
                  ),
                  SizedBox(
                    width: cardWidth,
                    child: const _ProductCard(
                      title: 'Macarons',
                      category: 'Macarons',
                      price: '\$15.55',
                      discountLabel: '-50%',
                    ),
                  ),
                  SizedBox(
                    width: cardWidth,
                    child: const _ProductCard(
                      title: 'Fruits cake',
                      category: 'Cake',
                      price: '\$15.55',
                      discountLabel: '-50%',
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  const _ProductCard({
    required this.title,
    required this.category,
    required this.price,
    required this.discountLabel,
  });

  final String title;
  final String category;
  final String price;
  final String discountLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: SweetsColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A343A40),
            offset: Offset(0, 12),
            blurRadius: 20,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/images/product_tart.png',
                  height: 124,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 124,
                      color: SweetsColors.grayLighter,
                    );
                  },
                ),
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  decoration: BoxDecoration(
                    color: SweetsColors.primary,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    discountLabel,
                    style: const TextStyle(
                      fontFamily: 'Geist',
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      height: 16 / 12,
                      color: SweetsColors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'Geist',
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    height: 18 / 18,
                    letterSpacing: -0.36,
                    color: SweetsColors.black,
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: SweetsColors.primaryLighter,
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Text(
                  category,
                  style: const TextStyle(
                    fontFamily: 'Geist',
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    height: 16 / 12,
                    color: SweetsColors.black,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            price,
            style: const TextStyle(
              fontFamily: 'Geist',
              fontWeight: FontWeight.w500,
              fontSize: 16,
              height: 24 / 16,
              color: SweetsColors.grayDarker,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: SweetsColors.grayLighter,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.shopping_bag_outlined,
                        size: 20,
                        color: SweetsColors.grayDarker,
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Add to cart',
                        style: TextStyle(
                          fontFamily: 'Geist',
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          height: 20 / 14,
                          color: SweetsColors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: SweetsColors.grayLighter,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.favorite_border,
                  size: 20,
                  color: SweetsColors.grayDarker,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ExploreTabBar extends StatelessWidget {
  const _ExploreTabBar();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        color: SweetsColors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: SweetsColors.white,
                border: Border(
                  top: BorderSide(
                    color: SweetsColors.border.withOpacity(0.75),
                  ),
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                _TabItem(label: 'Home', icon: Icons.home_outlined, active: false),
                _TabItem(
                    label: 'Explore',
                    icon: Icons.search_rounded,
                    active: true),
                _TabItem(
                    label: 'Favorites',
                    icon: Icons.favorite_border,
                    active: false),
                _TabItem(
                    label: 'Cart',
                    icon: Icons.shopping_bag_outlined,
                    active: false),
                _TabItem(
                    label: 'Account',
                    icon: Icons.person_outline,
                    active: false),
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

class _TabItem extends StatelessWidget {
  const _TabItem({
    required this.label,
    required this.icon,
    required this.active,
  });

  final String label;
  final IconData icon;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: active ? SweetsColors.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            boxShadow: active
                ? const [
                    BoxShadow(
                      color: Color(0x66FD7E14),
                      blurRadius: 12,
                      offset: Offset(0, 6),
                    ),
                  ]
                : null,
          ),
          child: Icon(
            icon,
            size: 24,
            color: active ? SweetsColors.white : SweetsColors.grayDarker,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontFamily: 'Geist',
            fontWeight: FontWeight.w400,
            fontSize: 12,
            height: 16 / 12,
            color: active ? SweetsColors.primary : const Color(0xFF475467),
          ),
        ),
      ],
    );
  }
}

