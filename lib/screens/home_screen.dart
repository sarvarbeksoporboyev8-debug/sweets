import 'dart:ui';
import 'package:flutter/material.dart';
import '../theme/sweets_theme.dart';
import '../widgets/sweets_home_indicator.dart';

/// Home / 01 – full "Explore sweets" home screen.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showSideMenu = false;

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
                    child: _HomeTopBar(
                      onMenuTap: () {
                        setState(() {
                          _showSideMenu = true;
                        });
                      },
                    ),
                  ),
                  const _HomeCategoriesRow(),
                  const SizedBox(height: 16),
                  const _HomeBannersSection(),
                  Transform.translate(
                    offset: const Offset(0, -32),
                    child: const _BestProductsSection(),
                  ),
                ],
              ),
            ),
          ),
          // Bottom tab bar + home indicator
          const _HomeTabBar(),
          // Side menu overlay
          if (_showSideMenu)
            _SideMenu(
              onClose: () {
                setState(() {
                  _showSideMenu = false;
                });
              },
            ),
        ],
      ),
    );
  }
}

class _HomeTopBar extends StatelessWidget {
  const _HomeTopBar({required this.onMenuTap});

  final VoidCallback onMenuTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 12),
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
                        child: Image.asset('images/figma/bcbbd298-6443-4431-b696-509ef85e5849.png',
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
                    children: [
                      GestureDetector(
                        onTap: onMenuTap,
                        child: const _CircleIconButton(
                          icon: Icons.more_horiz,
                        ),
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('/notifications');
                        },
                        child: Stack(
                          children: const [
                            _CircleIconButton(
                              icon: Icons.notifications_none_rounded,
                            ),
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
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12),
              // Search field
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

class _HomeCategoriesRow extends StatelessWidget {
  const _HomeCategoriesRow();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
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
                style: const TextStyle(
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
                _HomeCategoryPill(
                  label: 'Chocolate',
                  imageUrl:
                      'images/figma/ae6f4223-eaee-47bb-8fc1-80b40b311a20.png',
                ),
                _HomeCategoryPill(
                  label: 'Croissant',
                  imageUrl:
                      'images/figma/89103dfd-a882-41ff-af03-722d16ef829e.png',
                ),
                _HomeCategoryPill(
                  label: 'Donuts',
                  imageUrl:
                      'images/figma/af732309-cc6e-456d-9081-d8a83410e5e9.png',
                ),
                _HomeCategoryPill(
                  label: 'Tarts',
                  imageUrl:
                      'images/figma/12296479-78cd-41e6-8a71-6553130b4c30.png',
                ),
                _HomeCategoryPill(
                  label: 'Pies',
                  imageUrl:
                      'images/figma/57081f42-5f04-4c43-872d-8d65d47faec7.png',
                ),
                _HomeCategoryPill(
                  label: 'Macarons',
                  imageUrl:
                      'images/figma/0725c68f-d1f8-4c1a-bdef-f4af6706b1ad.png',
                ),
                _HomeCategoryPill(
                  label: 'Cookies',
                  imageUrl:
                      'images/figma/cb8efe13-b792-4611-8999-2e7d51e48379.png',
                ),
                _HomeCategoryPill(
                  label: 'Pancake',
                  imageUrl:
                      'images/figma/7b8893bf-40fb-4640-b9ec-14d99dba4ba1.png',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HomeCategoryPill extends StatelessWidget {
  const _HomeCategoryPill({
    required this.label,
    required this.imageUrl,
  });

  final String label;
  final String imageUrl;

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
                imageUrl,
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

class _HomeBannersSection extends StatelessWidget {
  const _HomeBannersSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final cardWidth = (constraints.maxWidth - 12) / 2;

          return Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              SizedBox(
                width: cardWidth,
                child: const _HomePromoCard(
                  title: 'Delicious\ncupcake',
                  imagePath: 'assets/images/promo_cupcake.png',
                  height: 247,
                ),
              ),
              SizedBox(
                width: cardWidth,
                child: const _HomePromoCard(
                  title: 'The most\ndelicious and\ntasty desserts.',
                  imagePath: 'assets/images/promo_desserts.png',
                  height: 173,
                ),
              ),
              SizedBox(
                width: cardWidth,
                child: const _HomePromoCard(
                  title: 'Delicious\ndonuts for you',
                  imagePath: 'assets/images/promo_donuts.png',
                  height: 173,
                ),
              ),
              Transform.translate(
                offset: const Offset(0, -74),
                child: SizedBox(
                  width: cardWidth,
                  child: const _HomePromoCard(
                    title: 'Delicious\nFruit cake',
                    imagePath: 'assets/images/promo_fruit_cake.png',
                    height: 247,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _HomePromoCard extends StatelessWidget {
  const _HomePromoCard({
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

class _HomeBanner extends StatelessWidget {
  const _HomeBanner._({
    required this.text,
    required this.imageUrl,
    required this.width,
    required this.height,
  });

  factory _HomeBanner.large({
    required String text,
    required String imageUrl,
  }) =>
      _HomeBanner._(
        text: text,
        imageUrl: imageUrl,
        width: 188,
        height: 274,
      );

  factory _HomeBanner.small({
    required String title,
    required String imageUrl,
  }) =>
      _HomeBanner._(
        text: title,
        imageUrl: imageUrl,
        width: 188,
        height: 200,
      );

  final String text;
  final String imageUrl;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
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
          Positioned(
            right: -40,
            top: -20,
            child: Image.asset(
              imageUrl,
              width: width + 100,
              height: height,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return const SizedBox.shrink();
              },
            ),
          ),
          Positioned(
            left: 16,
            top: 16,
            right: 16,
            child: Text(
              text,
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
      padding: const EdgeInsets.symmetric(horizontal: 16),
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
          const SizedBox(height: 16),
          LayoutBuilder(
            builder: (context, constraints) {
              final cardWidth = (constraints.maxWidth - 12) / 2;
              
              return Wrap(
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
              );
            },
          ),
        ],
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
                  // For now we reuse one image; replace with assets for 1:1 visuals.
                  'images/figma/f67fe315-bd20-4125-86f6-d47df0749327.png',
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
              // Discount badge
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

class _HomeTabBar extends StatelessWidget {
  const _HomeTabBar();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        color: SweetsColors.white,
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
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
                    _TabItem(label: 'Home', icon: Icons.home_filled, active: true),
                    _TabItem(
                        label: 'Explore',
                        icon: Icons.search_rounded,
                        active: false),
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
              // Home indicator - inline to avoid nested SafeArea
              SafeArea(
                top: false,
                child: SizedBox(
                  height: 34,
                  child: Center(
                    child: Container(
                      height: 5,
                      width: 134,
                      decoration: BoxDecoration(
                        color: SweetsColors.black,
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
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

class _SideMenu extends StatelessWidget {
  const _SideMenu({required this.onClose});

  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Backdrop
        Positioned.fill(
          child: GestureDetector(
            onTap: onClose,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
              child: Container(
                color: Colors.black.withOpacity(0.25),
              ),
            ),
          ),
        ),
        // Side menu
        Positioned(
          left: 0,
          top: 0,
          bottom: 0,
          child: Container(
            width: 220,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: SweetsColors.white,
              boxShadow: const [
                BoxShadow(
                  color: Color(0x1A343A40),
                  offset: Offset(0, 12),
                  blurRadius: 20,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Close button - circular icon
                GestureDetector(
                  onTap: onClose,
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.close_rounded,
                      size: 24,
                      color: SweetsColors.grayDarker,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                // Menu items
                _SideMenuItem(
                  icon: Icons.phone_iphone,
                  label: 'About us',
                  onTap: () {
                    onClose();
                    Navigator.of(context).pushNamed('/aboutUs');
                  },
                ),
                const SizedBox(height: 24),
                _SideMenuItem(
                  icon: Icons.send,
                  label: 'Contact us',
                  onTap: () {
                    onClose();
                    Navigator.of(context).pushNamed('/contactUs');
                  },
                ),
                const SizedBox(height: 24),
                _SideMenuItem(
                  icon: Icons.star,
                  label: 'Rate the app',
                  onTap: () {
                    onClose();
                    Navigator.of(context).pushNamed('/rateTheApp');
                  },
                ),
                const SizedBox(height: 24),
                _SideMenuItem(
                  icon: Icons.note_add,
                  label: 'Add notes',
                  onTap: () {
                    onClose();
                    Navigator.of(context).pushNamed('/addNotes');
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _SideMenuItem extends StatelessWidget {
  const _SideMenuItem({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontFamily: 'Geist',
              fontWeight: FontWeight.w400,
              fontSize: 16,
              height: 24 / 16,
              color: SweetsColors.grayDarker,
            ),
          ),
          const SizedBox(width: 12),
          Icon(
            icon,
            size: 24,
            color: SweetsColors.grayDarker,
          ),
        ],
      ),
    );
  }
}

