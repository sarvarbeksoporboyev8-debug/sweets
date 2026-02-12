/// Model class for product rating data
class ProductRating {
  final String id;
  final String productName;
  final String? productImage;
  int rating;
  String reviewerName;
  String review;

  ProductRating({
    required this.id,
    required this.productName,
    this.productImage,
    this.rating = 0,
    this.reviewerName = '',
    this.review = '',
  });

  ProductRating copyWith({
    String? id,
    String? productName,
    String? productImage,
    int? rating,
    String? reviewerName,
    String? review,
  }) {
    return ProductRating(
      id: id ?? this.id,
      productName: productName ?? this.productName,
      productImage: productImage ?? this.productImage,
      rating: rating ?? this.rating,
      reviewerName: reviewerName ?? this.reviewerName,
      review: review ?? this.review,
    );
  }

  bool get isValid => rating > 0 && reviewerName.isNotEmpty;
}
