import 'product_variant_model.dart';
import 'product_review_model.dart';

/// Model class for products
class Product {
  final String id;
  final String name;
  final String category;
  final String description;
  final double basePrice;
  final double rating;
  final int reviewCount;
  final List<String> images;
  final List<ProductVariant> variants;
  final List<String> specifications;
  final List<ProductReview> reviews;
  
  const Product({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.basePrice,
    required this.rating,
    required this.reviewCount,
    required this.images,
    required this.variants,
    required this.specifications,
    required this.reviews,
  });
}
