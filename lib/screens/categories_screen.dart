import 'package:flutter/material.dart';
import '../theme/sweets_theme.dart';
import '../widgets/sweets_navigation_bar.dart';
import '../widgets/sweets_home_indicator.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SweetsColors.white,
      body: Stack(
        children: [
          // Gradient background
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Container(
              height: 168,
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
            ),
          ),
          // Main content with Column layout
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SweetsNavigationBar(title: 'Categories'),
                  const SizedBox(height: 24),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Categories',
                      style: TextStyle(
                        fontFamily: 'Geist',
                        fontWeight: FontWeight.w600,
                        fontSize: 32,
                        height: 1.0,
                        letterSpacing: -0.96,
                        color: SweetsColors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                        bottom: 100,
                      ),
                      child: Center(
                        child: Wrap(
                          alignment: WrapAlignment.start,
                          spacing: 16,
                          runSpacing: 16,
                          children: const [
                          _CategoryTile(
                            label: 'Chocolate',
                            imageUrl:
                                'images/figma/ffa912c3-4192-44d0-b112-f3975f484f24.png',
                          ),
                          _CategoryTile(
                            label: 'Croissant',
                            imageUrl:
                                'images/figma/68571720-c179-424c-9ce0-b96991ee5f66.png',
                          ),
                          _CategoryTile(
                            label: 'Donuts',
                            imageUrl:
                                'images/figma/1d690edd-2533-4254-81f8-6827b0c89913.png',
                          ),
                          _CategoryTile(
                            label: 'Tarts',
                            imageUrl:
                                'images/figma/98c34296-10bc-4743-a416-8cd8a9913f3f.png',
                          ),
                          _CategoryTile(
                            label: 'Pies',
                            imageUrl:
                                'images/figma/d3d3f210-0411-44cd-b624-2a9a28179ac6.png',
                          ),
                          _CategoryTile(
                            label: 'Macarons',
                            imageUrl:
                                'images/figma/564a1305-efb3-4e04-a407-df0392e9604c.png',
                          ),
                          _CategoryTile(
                            label: 'Cookies',
                            imageUrl:
                                'images/figma/5db4b05e-6313-4180-bc2b-927320a84b95.png',
                          ),
                          _CategoryTile(
                            label: 'Pancake',
                            imageUrl:
                                'images/figma/48708860-4fb6-4589-99c8-fabb15ba5a8c.png',
                          ),
                          _CategoryTile(
                            label: 'Waffle',
                            imageUrl:
                                'images/figma/567f881f-7896-4d30-8f89-de6df1b10bd7.png',
                          ),
                          _CategoryTile(
                            label: 'Pretzel',
                            imageUrl:
                                'images/figma/f670a542-a60b-4aa0-8c9b-8e437932ab03.png',
                          ),
                          _CategoryTile(
                            label: 'Fruit Cake',
                            imageUrl:
                                'images/figma/f33dc672-3cdd-4697-a4b3-8961c6256997.png',
                          ),
                          _CategoryTile(
                            label: 'Ice Cream',
                            imageUrl:
                                'images/figma/d3234b4c-a2da-4772-89c7-6bca71139ff1.png',
                          ),
                        ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Home indicator
          const Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: SweetsHomeIndicator(),
          ),
        ],
      ),
    );
  }
}

class _CategoryTile extends StatelessWidget {
  const _CategoryTile({
    required this.label,
    required this.imageUrl,
  });

  final String label;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 121,
      child: Column(
        children: [
          Container(
            width: 121,
            height: 121,
            decoration: BoxDecoration(
              color: const Color(0xFFFFDEBB),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: Image.asset(
                imageUrl,
                width: 96,
                height: 96,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.local_cafe,
                    size: 40,
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
              fontSize: 16,
              height: 24 / 16,
              color: SweetsColors.grayDarker,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

