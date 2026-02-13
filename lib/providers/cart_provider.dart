import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/product_model.dart';

/// Cart item model
class CartItem {
  final String id;
  final String productId;
  final String title;
  final double price;
  final int quantity;
  final String? imageUrl;

  CartItem({
    required this.id,
    required this.productId,
    required this.title,
    required this.price,
    required this.quantity,
    this.imageUrl,
  });

  CartItem copyWith({
    String? id,
    String? productId,
    String? title,
    double? price,
    int? quantity,
    String? imageUrl,
  }) {
    return CartItem(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      title: title ?? this.title,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'productId': productId,
      'title': title,
      'price': price,
      'quantity': quantity,
      'imageUrl': imageUrl,
    };
  }

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'] as String,
      productId: json['productId'] as String,
      title: json['title'] as String,
      price: (json['price'] as num).toDouble(),
      quantity: json['quantity'] as int,
      imageUrl: json['imageUrl'] as String?,
    );
  }
}

/// Cart state provider
class CartProvider with ChangeNotifier {
  List<CartItem> _items = [];
  bool _isLoading = false;

  List<CartItem> get items => List.unmodifiable(_items);
  bool get isLoading => _isLoading;
  
  int get itemCount => _items.fold(0, (sum, item) => sum + item.quantity);
  
  double get totalPrice => _items.fold(
    0.0,
    (sum, item) => sum + (item.price * item.quantity),
  );

  bool get isEmpty => _items.isEmpty;
  bool get isNotEmpty => _items.isNotEmpty;

  /// Initialize and load cart from storage
  Future<void> initialize() async {
    _isLoading = true;
    notifyListeners();

    try {
      final prefs = await SharedPreferences.getInstance();
      final cartJson = prefs.getString('cart');
      
      if (cartJson != null && cartJson.isNotEmpty) {
        final List<dynamic> decoded = jsonDecode(cartJson);
        _items = decoded.map((item) => CartItem.fromJson(item)).toList();
      }
    } catch (e) {
      debugPrint('Error loading cart: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Save cart to storage
  Future<void> _saveCart() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final cartJson = jsonEncode(_items.map((item) => item.toJson()).toList());
      await prefs.setString('cart', cartJson);
    } catch (e) {
      debugPrint('Error saving cart: $e');
    }
  }

  /// Add item to cart or update quantity if exists
  Future<void> addItem({
    required String productId,
    required String title,
    required double price,
    String? imageUrl,
    int quantity = 1,
  }) async {
    final existingIndex = _items.indexWhere((item) => item.productId == productId);

    if (existingIndex >= 0) {
      // Update existing item
      _items[existingIndex] = _items[existingIndex].copyWith(
        quantity: _items[existingIndex].quantity + quantity,
      );
    } else {
      // Add new item
      _items.add(CartItem(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        productId: productId,
        title: title,
        price: price,
        quantity: quantity,
        imageUrl: imageUrl,
      ));
    }

    notifyListeners();
    await _saveCart();
  }

  /// Update item quantity
  Future<void> updateQuantity(String itemId, int newQuantity) async {
    if (newQuantity <= 0) {
      await removeItem(itemId);
      return;
    }

    final index = _items.indexWhere((item) => item.id == itemId);
    if (index >= 0) {
      _items[index] = _items[index].copyWith(quantity: newQuantity);
      notifyListeners();
      await _saveCart();
    }
  }

  /// Increment item quantity
  Future<void> incrementQuantity(String itemId) async {
    final index = _items.indexWhere((item) => item.id == itemId);
    if (index >= 0) {
      _items[index] = _items[index].copyWith(
        quantity: _items[index].quantity + 1,
      );
      notifyListeners();
      await _saveCart();
    }
  }

  /// Decrement item quantity
  Future<void> decrementQuantity(String itemId) async {
    final index = _items.indexWhere((item) => item.id == itemId);
    if (index >= 0) {
      final newQuantity = _items[index].quantity - 1;
      if (newQuantity <= 0) {
        await removeItem(itemId);
      } else {
        _items[index] = _items[index].copyWith(quantity: newQuantity);
        notifyListeners();
        await _saveCart();
      }
    }
  }

  /// Remove item from cart
  Future<void> removeItem(String itemId) async {
    _items.removeWhere((item) => item.id == itemId);
    notifyListeners();
    await _saveCart();
  }

  /// Clear all items from cart
  Future<void> clear() async {
    _items.clear();
    notifyListeners();
    await _saveCart();
  }

  /// Check if product is in cart
  bool isInCart(String productId) {
    return _items.any((item) => item.productId == productId);
  }

  /// Get quantity of a specific product
  int getProductQuantity(String productId) {
    final item = _items.firstWhere(
      (item) => item.productId == productId,
      orElse: () => CartItem(
        id: '',
        productId: '',
        title: '',
        price: 0,
        quantity: 0,
      ),
    );
    return item.quantity;
  }
}
