/// Represents an app review with rating and review text
class AppReview {
  final int rating;
  final String name;
  final String reviewText;

  AppReview({
    required this.rating,
    required this.name,
    required this.reviewText,
  });

  bool isValid() {
    return rating > 0 && name.isNotEmpty && reviewText.isNotEmpty;
  }
}
