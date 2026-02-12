import 'package:flutter/material.dart';
import '../theme/sweets_theme.dart';
import '../widgets/sweets_home_indicator.dart';
import '../widgets/sweets_button.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SweetsColors.white,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Navigation bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 20,
                        color: SweetsColors.grayDarker,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Blueberry pie',
                      style: TextStyle(
                        fontFamily: 'Geist',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        height: 20 / 14,
                        color: SweetsColors.grayDarker,
                      ),
                    ),
                  ],
                ),
              ),
              // Product image
              SizedBox(
                height: 300,
                width: double.infinity,
                child: Image.asset(
                  'images/figma/f9606ece-9272-43ec-8f6a-34f3b53b9f68.png',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: SweetsColors.grayLighter,
                      child: const Icon(
                        Icons.image,
                        size: 80,
                        color: SweetsColors.gray,
                      ),
                    );
                  },
                ),
              ),
              // Product details section
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: SweetsColors.primaryLighter,
                            borderRadius: BorderRadius.circular(28),
                          ),
                          child: const Text(
                            'Pies',
                            style: TextStyle(
                              fontFamily: 'Geist',
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              height: 16 / 12,
                              color: SweetsColors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Dilicious blueberry pie for your occasion',
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
                    const SizedBox(height: 12),
                    Row(
                      children: const [
                        Text(
                          'Price : ',
                          style: TextStyle(
                            fontFamily: 'Geist',
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            height: 24 / 16,
                            color: SweetsColors.grayDark,
                          ),
                        ),
                        Text(
                          '\$15.55',
                          style: TextStyle(
                            fontFamily: 'Geist',
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            height: 18 / 18,
                            letterSpacing: -0.36,
                            color: SweetsColors.grayDarker,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: SweetsColors.white,
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(
                              color: SweetsColors.border.withOpacity(0.75),
                            ),
                          ),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.star,
                                size: 16,
                                color: SweetsColors.grayDark,
                              ),
                              SizedBox(width: 4),
                              Text(
                                '5.0',
                                style: TextStyle(
                                  fontFamily: 'Geist',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  height: 16 / 12,
                                  color: SweetsColors.grayDark,
                                ),
                              ),
                              Text(
                                '.',
                                style: TextStyle(
                                  fontFamily: 'Geist',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  height: 16 / 12,
                                  color: SweetsColors.grayDark,
                                ),
                              ),
                              Text(
                                '90 Reviews',
                                style: TextStyle(
                                  fontFamily: 'Geist',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  height: 16 / 12,
                                  color: SweetsColors.grayDark,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
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
                    const SizedBox(height: 12),
                    const Text(
                      'Blueberry pie is a pie with a blueberry filling. Blueberry pie is readily made because it does not require pitting or peeling of fruit. It usually has a top and bottom crust. The top crust can be circular, but the pie can also have a crumble crust or no top crust.',
                      style: TextStyle(
                        fontFamily: 'Geist',
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        height: 24 / 16,
                        color: SweetsColors.grayDark,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: SweetsColors.white,
          border: Border(
            top: BorderSide(
              color: SweetsColors.border.withOpacity(0.75),
            ),
          ),
        ),
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Qty :',
                    style: TextStyle(
                      fontFamily: 'Geist',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      height: 24 / 16,
                      color: SweetsColors.grayDarker,
                    ),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          // TODO: Decrease quantity
                        },
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Icon(
                            Icons.remove_circle_outline,
                            size: 24,
                            color: SweetsColors.grayDarker,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        width: 28,
                        alignment: Alignment.center,
                        child: const Text(
                          '02',
                          style: TextStyle(
                            fontFamily: 'Geist',
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            height: 24 / 16,
                            color: SweetsColors.grayDarker,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      GestureDetector(
                        onTap: () {
                          // TODO: Increase quantity
                        },
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Icon(
                            Icons.add_circle_outline,
                            size: 24,
                            color: SweetsColors.grayDarker,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),
              SweetsPrimaryButton(
                label: 'Add to cart',
                onPressed: () {
                  // TODO: Add to cart
                },
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 56,
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    // TODO: Add rating
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: SweetsColors.primary,
                    side: const BorderSide(color: SweetsColors.primary),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  ),
                  child: const Text(
                    'Add your rating',
                    style: TextStyle(
                      fontFamily: 'Geist',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      height: 24 / 16,
                      color: SweetsColors.primary,
                    ),
                  ),
                ),
              ),
              const SweetsHomeIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
