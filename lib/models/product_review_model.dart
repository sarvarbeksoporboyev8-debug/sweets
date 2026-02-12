/// Model class for product reviews
class ProductReview {
  final String id;
  final String userName;
  final int rating;
  final String title;
  final String comment;
  final DateTime date;
  
  const ProductReview({
    required this.id,
    required this.userName,
    required this.rating,
    required this.title,
    required this.comment,
    required this.date,
  });
}
