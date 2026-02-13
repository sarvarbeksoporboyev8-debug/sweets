import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/sweets_theme.dart';
import '../constants/colors.dart';
import '../constants/spacing.dart';
import '../constants/gradients.dart';
import '../widgets/home/home_top_bar.dart';
import '../widgets/home/home_category_pill.dart';
import '../widgets/home/home_product_card.dart';
import '../widgets/home/shirin_biscuit_header.dart';
import '../widgets/sweets_tab_bar.dart';
import '../providers/cart_provider.dart';
import '../providers/favorites_provider.dart';

/// Home / 01 – full "Explore sweets" home screen.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SweetsColors.white,
      body: Stack(
        children: [
          SafeArea(
            bottom: false,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // White background with header
                  Container(
                    color: SweetsColors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: Spacing.md,
                        left: Spacing.md,
                        right: Spacing.md,
                        bottom: Spacing.spacing12,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Top row with header and action buttons
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const ShirinBiscuitHeader(),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushNamed('/notifications');
                                },
                                child: Stack(
                                  children: [
                                    Container(
                                      width: 36,
                                      height: 36,
                                      decoration: const BoxDecoration(
                                        color: SweetsColors.white,
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(0x0D000000),
                                            offset: Offset(0, 1),
                                            blurRadius: 3,
                                          ),
                                        ],
                                      ),
                                      child: const Icon(
                                        Icons.notifications_none_rounded,
                                        size: 24,
                                        color: SweetsColors.grayDarker,
                                      ),
                                    ),
                                    const Positioned(
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
                          const SizedBox(height: Spacing.spacing12),
                          // Search bar
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 14,
                            ),
                            decoration: BoxDecoration(
                              color: SweetsColors.white,
                              borderRadius: BorderRadius.circular(Spacing.spacing12),
                              border: Border.all(color: SweetsColors.border),
                            ),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.search,
                                  size: 20,
                                  color: SweetsColors.gray,
                                ),
                                SizedBox(width: Spacing.xs),
                                Text(
                                  'Search',
                                  style: TextStyle(
                                    fontFamily: 'Geist',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    height: 20 / 14,
                                    color: SweetsColors.gray,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const _HomeCategoriesRow(),
                  const SizedBox(height: Spacing.md),
                  const _HomeBannersSection(),
                  const SizedBox(height: Spacing.md),
                  const _BestProductsSection(),
                  const SizedBox(height: Spacing.md),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SweetsTabBar(
        activeTab: 'Home',
        onTabTap: (tab) {
          switch (tab) {
            case 'Home':
              // Already on home, do nothing
              break;
            case 'Explore':
              Navigator.pushReplacementNamed(context, '/explore');
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

class _HomeCategoriesRow extends StatelessWidget {
  const _HomeCategoriesRow();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.md),
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
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/explore');
                },
                child: const Text(
                  'View more',
                  style: TextStyle(
                    fontFamily: 'Geist',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    height: 20 / 14,
                    color: SweetsColors.primary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: Spacing.spacing12),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                HomeCategoryPill(
                  label: 'Chocolate',
                  imageUrl:
                      'images/figma/ae6f4223-eaee-47bb-8fc1-80b40b311a20.png',
                  colorIndex: 0, // Purple
                  onTap: () {
                    Navigator.pushNamed(context, '/categories', arguments: {'category': 'Chocolate'});
                  },
                ),
                HomeCategoryPill(
                  label: 'Croissant',
                  imageUrl:
                      'images/figma/89103dfd-a882-41ff-af03-722d16ef829e.png',
                  colorIndex: 1, // Cyan
                  onTap: () {
                    Navigator.pushNamed(context, '/categories', arguments: {'category': 'Croissant'});
                  },
                ),
                HomeCategoryPill(
                  label: 'Donuts',
                  imageUrl:
                      'images/figma/af732309-cc6e-456d-9081-d8a83410e5e9.png',
                  colorIndex: 2, // Peach
                  onTap: () {
                    Navigator.pushNamed(context, '/categories', arguments: {'category': 'Donuts'});
                  },
                ),
                HomeCategoryPill(
                  label: 'Tarts',
                  imageUrl:
                      'images/figma/12296479-78cd-41e6-8a71-6553130b4c30.png',
                  colorIndex: 3, // Yellow
                  onTap: () {
                    Navigator.pushNamed(context, '/categories', arguments: {'category': 'Tarts'});
                  },
                ),
                HomeCategoryPill(
                  label: 'Pies',
                  imageUrl:
                      'images/figma/57081f42-5f04-4c43-872d-8d65d47faec7.png',
                  colorIndex: 0, // Purple (rotation)
                  onTap: () {
                    Navigator.pushNamed(context, '/categories', arguments: {'category': 'Pies'});
                  },
                ),
                HomeCategoryPill(
                  label: 'Macarons',
                  imageUrl:
                      'images/figma/0725c68f-d1f8-4c1a-bdef-f4af6706b1ad.png',
                  colorIndex: 1, // Cyan
                  onTap: () {
                    Navigator.pushNamed(context, '/categories', arguments: {'category': 'Macarons'});
                  },
                ),
                HomeCategoryPill(
                  label: 'Cookies',
                  imageUrl:
                      'images/figma/cb8efe13-b792-4611-8999-2e7d51e48379.png',
                  colorIndex: 2, // Peach
                  onTap: () {
                    Navigator.pushNamed(context, '/categories', arguments: {'category': 'Cookies'});
                  },
                ),
                HomeCategoryPill(
                  label: 'Pancake',
                  imageUrl:
                      'images/figma/7b8893bf-40fb-4640-b9ec-14d99dba4ba1.png',
                  colorIndex: 3, // Yellow
                  onTap: () {
                    Navigator.pushNamed(context, '/categories', arguments: {'category': 'Pancake'});
                  },
                ),
              ],
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
                      child: const _HomePromoCard(
                        title: 'Delicious\ncupcake',
                        imagePath: 'assets/images/promo_cupcake.png',
                        height: 173,
                      ),
                    ),
                    const SizedBox(height: Spacing.spacing12),
                    SizedBox(
                      width: cardWidth,
                      child: const _HomePromoCard(
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
                      child: const _HomePromoCard(
                        title: 'The most\ndelicious and\ntasty desserts.',
                        imagePath: 'assets/images/promo_desserts.png',
                        height: 173,
                      ),
                    ),
                    const SizedBox(height: Spacing.spacing12),
                    SizedBox(
                      width: cardWidth,
                      child: const _HomePromoCard(
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
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/explore');
                },
                child: Text(
                  'View more',
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: SweetsColors.primary,
                  ),
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
                    child: HomeProductCard(
                      productId: 'prod_1',
                      title: 'Fruits tart',
                      category: 'Tarts',
                      price: '\$15.55',
                      discountLabel: '-50%',
                      colorIndex: 0, // Purple
                      onTap: () {
                        Navigator.pushNamed(context, '/productDetail', arguments: {'productId': 'prod_1'});
                      },
                      onAddToCart: () {
                        final cart = context.read<CartProvider>();
                        cart.addItem(
                          productId: 'prod_1',
                          title: 'Fruits tart',
                          price: 15.55,
                          imageUrl: 'images/figma/f67fe315-bd20-4125-86f6-d47df0749327.png',
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Added to cart'), duration: Duration(seconds: 1)),
                        );
                      },
                      onFavorite: () {
                        final favorites = context.read<FavoritesProvider>();
                        favorites.toggleFavorite(
                          productId: 'prod_1',
                          title: 'Fruits tart',
                          price: 15.55,
                          category: 'Tarts',
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: cardWidth,
                    child: HomeProductCard(
                      productId: 'prod_2',
                      title: 'Fruit tart',
                      category: 'Tarts',
                      price: '\$15.55',
                      discountLabel: '-60%',
                      colorIndex: 1, // Cyan
                      onTap: () {
                        Navigator.pushNamed(context, '/productDetail', arguments: {'productId': 'prod_2'});
                      },
                      onAddToCart: () {
                        final cart = context.read<CartProvider>();
                        cart.addItem(
                          productId: 'prod_2',
                          title: 'Fruit tart',
                          price: 15.55,
                          imageUrl: 'images/figma/f67fe315-bd20-4125-86f6-d47df0749327.png',
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Added to cart'), duration: Duration(seconds: 1)),
                        );
                      },
                      onFavorite: () {
                        final favorites = context.read<FavoritesProvider>();
                        favorites.toggleFavorite(
                          productId: 'prod_2',
                          title: 'Fruit tart',
                          price: 15.55,
                          category: 'Tarts',
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: cardWidth,
                    child: HomeProductCard(
                      productId: 'prod_3',
                      title: 'Apple tart',
                      category: 'Tarts',
                      price: '\$15.55',
                      discountLabel: '-50%',
                      colorIndex: 2, // Peach
                      onTap: () {
                        Navigator.pushNamed(context, '/productDetail', arguments: {'productId': 'prod_3'});
                      },
                      onAddToCart: () {
                        final cart = context.read<CartProvider>();
                        cart.addItem(
                          productId: 'prod_3',
                          title: 'Apple tart',
                          price: 15.55,
                          imageUrl: 'images/figma/f67fe315-bd20-4125-86f6-d47df0749327.png',
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Added to cart'), duration: Duration(seconds: 1)),
                        );
                      },
                      onFavorite: () {
                        final favorites = context.read<FavoritesProvider>();
                        favorites.toggleFavorite(
                          productId: 'prod_3',
                          title: 'Apple tart',
                          price: 15.55,
                          category: 'Tarts',
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: cardWidth,
                    child: HomeProductCard(
                      productId: 'prod_4',
                      title: 'Cupcakes',
                      category: 'Cupcake',
                      price: '\$15.55',
                      discountLabel: '-50%',
                      colorIndex: 3, // Yellow
                      onTap: () {
                        Navigator.pushNamed(context, '/productDetail', arguments: {'productId': 'prod_4'});
                      },
                      onAddToCart: () {
                        final cart = context.read<CartProvider>();
                        cart.addItem(
                          productId: 'prod_4',
                          title: 'Cupcakes',
                          price: 15.55,
                          imageUrl: 'images/figma/f67fe315-bd20-4125-86f6-d47df0749327.png',
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Added to cart'), duration: Duration(seconds: 1)),
                        );
                      },
                      onFavorite: () {
                        final favorites = context.read<FavoritesProvider>();
                        favorites.toggleFavorite(
                          productId: 'prod_4',
                          title: 'Cupcakes',
                          price: 15.55,
                          category: 'Cupcake',
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: cardWidth,
                    child: HomeProductCard(
                      productId: 'prod_5',
                      title: 'Donuts',
                      category: 'Donuts',
                      price: '\$15.55',
                      discountLabel: '-50%',
                      colorIndex: 0, // Purple (rotation)
                      onTap: () {
                        Navigator.pushNamed(context, '/productDetail', arguments: {'productId': 'prod_5'});
                      },
                      onAddToCart: () {
                        final cart = context.read<CartProvider>();
                        cart.addItem(
                          productId: 'prod_5',
                          title: 'Donuts',
                          price: 15.55,
                          imageUrl: 'images/figma/f67fe315-bd20-4125-86f6-d47df0749327.png',
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Added to cart'), duration: Duration(seconds: 1)),
                        );
                      },
                      onFavorite: () {
                        final favorites = context.read<FavoritesProvider>();
                        favorites.toggleFavorite(
                          productId: 'prod_5',
                          title: 'Donuts',
                          price: 15.55,
                          category: 'Donuts',
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: cardWidth,
                    child: HomeProductCard(
                      productId: 'prod_6',
                      title: 'Berry pie',
                      category: 'Pies',
                      price: '\$15.55',
                      discountLabel: '-50%',
                      colorIndex: 1, // Cyan
                      onTap: () {
                        Navigator.pushNamed(context, '/productDetail', arguments: {'productId': 'prod_6'});
                      },
                      onAddToCart: () {
                        final cart = context.read<CartProvider>();
                        cart.addItem(
                          productId: 'prod_6',
                          title: 'Berry pie',
                          price: 15.55,
                          imageUrl: 'images/figma/f67fe315-bd20-4125-86f6-d47df0749327.png',
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Added to cart'), duration: Duration(seconds: 1)),
                        );
                      },
                      onFavorite: () {
                        final favorites = context.read<FavoritesProvider>();
                        favorites.toggleFavorite(
                          productId: 'prod_6',
                          title: 'Berry pie',
                          price: 15.55,
                          category: 'Pies',
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: cardWidth,
                    child: HomeProductCard(
                      productId: 'prod_7',
                      title: 'Macarons',
                      category: 'Macarons',
                      price: '\$15.55',
                      discountLabel: '-50%',
                      colorIndex: 2, // Peach
                      onTap: () {
                        Navigator.pushNamed(context, '/productDetail', arguments: {'productId': 'prod_7'});
                      },
                      onAddToCart: () {
                        final cart = context.read<CartProvider>();
                        cart.addItem(
                          productId: 'prod_7',
                          title: 'Macarons',
                          price: 15.55,
                          imageUrl: 'images/figma/f67fe315-bd20-4125-86f6-d47df0749327.png',
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Added to cart'), duration: Duration(seconds: 1)),
                        );
                      },
                      onFavorite: () {
                        final favorites = context.read<FavoritesProvider>();
                        favorites.toggleFavorite(
                          productId: 'prod_7',
                          title: 'Macarons',
                          price: 15.55,
                          category: 'Macarons',
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: cardWidth,
                    child: HomeProductCard(
                      productId: 'prod_8',
                      title: 'Fruits cake',
                      category: 'Cake',
                      price: '\$15.55',
                      discountLabel: '-50%',
                      colorIndex: 3, // Yellow
                      onTap: () {
                        Navigator.pushNamed(context, '/productDetail', arguments: {'productId': 'prod_8'});
                      },
                      onAddToCart: () {
                        final cart = context.read<CartProvider>();
                        cart.addItem(
                          productId: 'prod_8',
                          title: 'Fruits cake',
                          price: 15.55,
                          imageUrl: 'images/figma/f67fe315-bd20-4125-86f6-d47df0749327.png',
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Added to cart'), duration: Duration(seconds: 1)),
                        );
                      },
                      onFavorite: () {
                        final favorites = context.read<FavoritesProvider>();
                        favorites.toggleFavorite(
                          productId: 'prod_8',
                          title: 'Fruits cake',
                          price: 15.55,
                          category: 'Cake',
                        );
                      },
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

