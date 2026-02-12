/// Model class for checkout items
class CheckoutItem {
  final String id;
  final String name;
  final String image;
  final double price;
  int quantity;

  CheckoutItem({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    this.quantity = 1,
  });

  /// Calculate total price for this item
  double get totalPrice => price * quantity;

  /// Create a copy of this item with optional changes
  CheckoutItem copyWith({int? quantity}) {
    return CheckoutItem(
      id: id,
      name: name,
      image: image,
      price: price,
      quantity: quantity ?? this.quantity,
    );
  }
}
