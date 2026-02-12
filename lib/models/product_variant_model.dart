/// Model class for product variants (size, color options)
class ProductVariant {
  final String id;
  final String size;
  final String color;
  final double price;
  final int stock;
  
  const ProductVariant({
    required this.id,
    required this.size,
    required this.color,
    required this.price,
    required this.stock,
  });
  
  bool get isInStock => stock > 0;
}
