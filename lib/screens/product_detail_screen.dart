import 'package:flutter/material.dart';
import '../theme/sweets_theme.dart';
import '../constants/spacing.dart';
import '../widgets/sweets_home_indicator.dart';
import '../widgets/sweets_button.dart';
import '../widgets/product/product_image_carousel.dart';
import '../widgets/product/product_info_section.dart';
import '../widgets/product/product_rating_display.dart';
import '../widgets/product/quantity_selector.dart';
import '../models/product_model.dart';
import '../models/product_variant_model.dart';
import '../models/product_review_model.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  late Product _product;
  int _quantity = 1;
  bool _isFavorite = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadProductDetails();
  }

  void _loadProductDetails() {
    // Mock product data - in real app, this would fetch from API
    _product = const Product(
      id: '1',
      name: 'Delicious blueberry pie for your occasion',
      category: 'Pies',
      description: 'Blueberry pie is a pie with a blueberry filling. Blueberry pie is readily made because it does not require pitting or peeling of fruit. It usually has a top and bottom crust. The top crust can be circular, but the pie can also have a crumble crust or no top crust.',
      basePrice: 15.55,
      rating: 5.0,
      reviewCount: 90,
      images: [
        'images/figma/f9606ece-9272-43ec-8f6a-34f3b53b9f68.png',
      ],
      variants: [],
      specifications: [],
      reviews: [],
    );
  }

  void _addToCart() {
    // TODO: Implement add to cart logic
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Added $_quantity item(s) to cart'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
  }

  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decrementQuantity() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SweetsColors.white,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(bottom: Spacing.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductImageCarousel(
                      images: _product.images,
                      onImageChange: (index) {},
                    ),
                    Padding(
                      padding: EdgeInsets.all(Spacing.lg),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProductInfoSection(
                            name: _product.name,
                            category: _product.category,
                            price: _product.basePrice,
                          ),
                          SizedBox(height: Spacing.md),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ProductRatingDisplay(
                                rating: _product.rating,
                                reviewCount: _product.reviewCount,
                              ),
                              GestureDetector(
                                onTap: _toggleFavorite,
                                child: Container(
                                  padding: EdgeInsets.all(Spacing.sm),
                                  decoration: BoxDecoration(
                                    color: SweetsColors.grayLighter,
                                    borderRadius: BorderRadius.circular(Spacing.borderRadius),
                                  ),
                                  child: Icon(
                                    _isFavorite ? Icons.favorite : Icons.favorite_border,
                                    size: Spacing.iconSm,
                                    color: _isFavorite ? SweetsColors.dangerDarker : SweetsColors.grayDarker,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: Spacing.md),
                          Text(
                            _product.description,
                            style: const TextStyle(
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
            _buildBottomSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Spacing.lg,
        vertical: 10,
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: Spacing.iconSm,
              color: SweetsColors.grayDarker,
            ),
          ),
          SizedBox(width: Spacing.sm),
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
    );
  }

  Widget _buildBottomSection() {
    return Container(
      padding: EdgeInsets.all(Spacing.lg),
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
            QuantitySelector(
              quantity: _quantity,
              onIncrement: _incrementQuantity,
              onDecrement: _quantity > 1 ? _decrementQuantity : null,
            ),
            SizedBox(height: Spacing.xl),
            SweetsPrimaryButton(
              label: 'Add to cart',
              onPressed: _addToCart,
            ),
            SizedBox(height: Spacing.sm),
            SizedBox(
              height: Spacing.buttonHeight,
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  // TODO: Add rating
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: SweetsColors.primary,
                  side: const BorderSide(color: SweetsColors.primary),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Spacing.borderRadiusLg),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 14,
                  ),
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
    );
  }
}
