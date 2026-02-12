import 'package:flutter/material.dart';
import '../../theme/sweets_theme.dart';
import '../../constants/colors.dart';
import '../../constants/spacing.dart';

/// Reusable product image carousel component with pagination
class ProductImageCarousel extends StatefulWidget {
  final List<String> images;
  final double height;
  final ValueChanged<int>? onImageChange;
  
  const ProductImageCarousel({
    super.key,
    required this.images,
    this.height = 300,
    this.onImageChange,
  });
  
  @override
  State<ProductImageCarousel> createState() => _ProductImageCarouselState();
}

class _ProductImageCarouselState extends State<ProductImageCarousel> {
  late PageController _pageController;
  int _currentPage = 0;
  
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }
  
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _currentPage = index);
              widget.onImageChange?.call(index);
            },
            itemCount: widget.images.length,
            itemBuilder: (context, index) {
              return Image.asset(
                widget.images[index],
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: SweetsColors.grayLighter,
                    child: const Icon(
                      Icons.image,
                      size: Spacing.iconLg,
                      color: SweetsColors.gray,
                    ),
                  );
                },
              );
            },
          ),
          if (widget.images.length > 1)
            Positioned(
              bottom: Spacing.lg,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  widget.images.length,
                  (index) => Container(
                    width: Spacing.sm,
                    height: Spacing.sm,
                    margin: EdgeInsets.symmetric(horizontal: Spacing.xs / 2),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentPage == index
                          ? SweetsColors.primary
                          : SweetsColors.white.withOpacity(0.5),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
