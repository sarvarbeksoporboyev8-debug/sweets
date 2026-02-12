import 'package:flutter/material.dart';
import '../theme/sweets_theme.dart';
import '../constants/spacing.dart';
import '../constants/gradients.dart';
import '../constants/responsive.dart';
import '../widgets/sweets_navigation_bar.dart';
import '../widgets/sweets_home_indicator.dart';
import '../widgets/categories/category_card.dart';

/// Category model for structured data
class Category {
  final String label;
  final String imageUrl;

  const Category({
    required this.label,
    required this.imageUrl,
  });
}

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  String? _selectedCategory;

  // Static list of categories
  static const List<Category> _categories = [
    Category(label: 'Chocolate', imageUrl: 'images/figma/ffa912c3-4192-44d0-b112-f3975f484f24.png'),
    Category(label: 'Croissant', imageUrl: 'images/figma/68571720-c179-424c-9ce0-b96991ee5f66.png'),
    Category(label: 'Donuts', imageUrl: 'images/figma/1d690edd-2533-4254-81f8-6827b0c89913.png'),
    Category(label: 'Tarts', imageUrl: 'images/figma/98c34296-10bc-4743-a416-8cd8a9913f3f.png'),
    Category(label: 'Pies', imageUrl: 'images/figma/d3d3f210-0411-44cd-b624-2a9a28179ac6.png'),
    Category(label: 'Macarons', imageUrl: 'images/figma/564a1305-efb3-4e04-a407-df0392e9604c.png'),
    Category(label: 'Cookies', imageUrl: 'images/figma/5db4b05e-6313-4180-bc2b-927320a84b95.png'),
    Category(label: 'Pancake', imageUrl: 'images/figma/48708860-4fb6-4589-99c8-fabb15ba5a8c.png'),
    Category(label: 'Waffle', imageUrl: 'images/figma/567f881f-7896-4d30-8f89-de6df1b10bd7.png'),
    Category(label: 'Pretzel', imageUrl: 'images/figma/f670a542-a60b-4aa0-8c9b-8e437932ab03.png'),
    Category(label: 'Fruit Cake', imageUrl: 'images/figma/f33dc672-3cdd-4697-a4b3-8961c6256997.png'),
    Category(label: 'Ice Cream', imageUrl: 'images/figma/d3234b4c-a2da-4772-89c7-6bca71139ff1.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SweetsColors.white,
      body: Column(
        children: [
          // Gradient background with navigation
          Container(
            decoration: const BoxDecoration(
              gradient: SweetsGradients.primaryHeader,
            ),
            child: SafeArea(
              bottom: false,
              child: const SweetsNavigationBar(title: 'Categories'),
            ),
          ),
          // Main content
          Expanded(
            child: SafeArea(
              top: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: Spacing.lg),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: Spacing.md),
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
                  const SizedBox(height: Spacing.lg),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.only(
                        left: Spacing.md,
                        right: Spacing.md,
                        bottom: 100,
                      ),
                      child: Center(
                        child: Wrap(
                          alignment: WrapAlignment.start,
                          spacing: Spacing.md,
                          runSpacing: Spacing.md,
                          children: _categories.map((category) {
                            return CategoryCard(
                              label: category.label,
                              imageUrl: category.imageUrl,
                              isSelected: _selectedCategory == category.label,
                              onTap: () {
                                setState(() {
                                  _selectedCategory = 
                                      _selectedCategory == category.label ? null : category.label;
                                });
                              },
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Home indicator
          const SweetsHomeIndicator(),
        ],
      ),
    );
  }
}

