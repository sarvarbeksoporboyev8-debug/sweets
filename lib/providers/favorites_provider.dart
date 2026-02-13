import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

/// Favorite product model
class FavoriteProduct {
  final String productId;
  final String title;
  final double price;
  final String? imageUrl;
  final double? rating;
  final String? category;

  FavoriteProduct({
    required this.productId,
    required this.title,
    required this.price,
    this.imageUrl,
    this.rating,
    this.category,
  });

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'title': title,
      'price': price,
      'imageUrl': imageUrl,
      'rating': rating,
      'category': category,
    };
  }

  factory FavoriteProduct.fromJson(Map<String, dynamic> json) {
    return FavoriteProduct(
      productId: json['productId'] as String,
      title: json['title'] as String,
      price: (json['price'] as num).toDouble(),
      imageUrl: json['imageUrl'] as String?,
      rating: json['rating'] != null ? (json['rating'] as num).toDouble() : null,
      category: json['category'] as String?,
    );
  }
}

/// Favorites state provider
class FavoritesProvider with ChangeNotifier {
  List<FavoriteProduct> _favorites = [];
  bool _isLoading = false;

  List<FavoriteProduct> get favorites => List.unmodifiable(_favorites);
  bool get isLoading => _isLoading;
  int get count => _favorites.length;
  bool get isEmpty => _favorites.isEmpty;
  bool get isNotEmpty => _favorites.isNotEmpty;

  /// Initialize and load favorites from storage
  Future<void> initialize() async {
    _isLoading = true;
    notifyListeners();

    try {
      final prefs = await SharedPreferences.getInstance();
      final favoritesJson = prefs.getString('favorites');
      
      if (favoritesJson != null && favoritesJson.isNotEmpty) {
        final List<dynamic> decoded = jsonDecode(favoritesJson);
        _favorites = decoded.map((item) => FavoriteProduct.fromJson(item)).toList();
      }
    } catch (e) {
      debugPrint('Error loading favorites: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Save favorites to storage
  Future<void> _saveFavorites() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final favoritesJson = jsonEncode(
        _favorites.map((item) => item.toJson()).toList(),
      );
      await prefs.setString('favorites', favoritesJson);
    } catch (e) {
      debugPrint('Error saving favorites: $e');
    }
  }

  /// Add product to favorites
  Future<void> addFavorite({
    required String productId,
    required String title,
    required double price,
    String? imageUrl,
    double? rating,
    String? category,
  }) async {
    // Check if already favorited
    if (isFavorite(productId)) {
      return;
    }

    _favorites.add(FavoriteProduct(
      productId: productId,
      title: title,
      price: price,
      imageUrl: imageUrl,
      rating: rating,
      category: category,
    ));

    notifyListeners();
    await _saveFavorites();
  }

  /// Remove product from favorites
  Future<void> removeFavorite(String productId) async {
    _favorites.removeWhere((item) => item.productId == productId);
    notifyListeners();
    await _saveFavorites();
  }

  /// Toggle favorite status
  Future<void> toggleFavorite({
    required String productId,
    required String title,
    required double price,
    String? imageUrl,
    double? rating,
    String? category,
  }) async {
    if (isFavorite(productId)) {
      await removeFavorite(productId);
    } else {
      await addFavorite(
        productId: productId,
        title: title,
        price: price,
        imageUrl: imageUrl,
        rating: rating,
        category: category,
      );
    }
  }

  /// Check if product is favorited
  bool isFavorite(String productId) {
    return _favorites.any((item) => item.productId == productId);
  }

  /// Clear all favorites
  Future<void> clearAll() async {
    _favorites.clear();
    notifyListeners();
    await _saveFavorites();
  }

  /// Get favorites by category
  List<FavoriteProduct> getFavoritesByCategory(String category) {
    return _favorites.where((item) => item.category == category).toList();
  }
}
