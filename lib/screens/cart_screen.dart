import 'package:flutter/material.dart';
import '../theme/sweets_theme.dart';
import '../constants/spacing.dart';
import '../widgets/sweets_home_indicator.dart';
import '../widgets/sweets_bottom_nav_bar.dart';

/// Cart screen with dynamic state management and responsive layout.
/// Demonstrates proper layout without Stack/Positioned abuse.
class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<CartItem> _cartItems = [
    CartItem(
      id: '1',
      title: 'Macarons',
      price: 15.55,
      quantity: 2,
      imageUrl: 'images/figma/c8744c0d-a1f2-44c6-b8a6-8dc1ecf24004.png',
    ),
    CartItem(
      id: '2',
      title: 'Donuts',
      price: 15.55,
      quantity: 2,
      imageUrl: 'images/figma/5e02251e-d20f-41c8-823f-c232783292db.png',
    ),
    CartItem(
      id: '3',
      title: 'Fruit tart',
      price: 15.55,
      quantity: 2,
      imageUrl: 'images/figma/378598d0-bcef-4f78-ac7e-43d695f82610.png',
    ),
    CartItem(
      id: '4',
      title: 'Chocolate cake',
      price: 15.55,
      quantity: 2,
      imageUrl: 'images/figma/db7b8e08-a056-47f5-8109-9bd5a4d184e2.png',
    ),
  ];

  void _updateQuantity(String itemId, int delta) {
    setState(() {
      final index = _cartItems.indexWhere((item) => item.id == itemId);
      if (index != -1) {
        final newQuantity = _cartItems[index].quantity + delta;
        if (newQuantity > 0) {
          _cartItems[index] = _cartItems[index].copyWith(quantity: newQuantity);
        }
      }
    });
  }

  void _removeItem(String itemId) {
    setState(() {
      _cartItems.removeWhere((item) => item.id == itemId);
    });
  }

  void _deleteAll() {
    setState(() {
      _cartItems.clear();
    });
  }

  double get _totalPrice {
    return _cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }

  int get _totalItems {
    return _cartItems.fold(0, (sum, item) => sum + item.quantity);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SweetsColors.white,
      body: Column(
        children: [
          // Gradient header background - using Container instead of positioned Stack
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFFFE6D1),
                  Color(0xFFFFFFFF),
                ],
                stops: [0.0, 1.0],
              ),
            ),
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.all(SweetsSpacing.padding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: SweetsSpacing.gapSmall),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Cart',
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                            const SizedBox(width: SweetsSpacing.xs),
                            Container(
                              width: 28,
                              height: 28,
                              decoration: const BoxDecoration(
                                color: SweetsColors.primaryLighter,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(
                                  _totalItems.toString(),
                                  style: const TextStyle(
                                    fontFamily: 'Geist',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    height: 20 / 14,
                                    color: SweetsColors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        if (_cartItems.isNotEmpty)
                          GestureDetector(
                            onTap: _deleteAll,
                            child: const Text(
                              'Delete all',
                              style: TextStyle(
                                fontFamily: 'Geist',
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                height: 20 / 14,
                                color: Color(0xFFFA5252),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          // Cart items list
          Expanded(
            child: _cartItems.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.shopping_cart_outlined,
                          size: 80,
                          color: SweetsColors.gray,
                        ),
                        const SizedBox(height: SweetsSpacing.padding),
                        Text(
                          'Your cart is empty',
                          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                fontSize: 24,
                              ),
                        ),
                      ],
                    ),
                  )
                : ListView.separated(
                    padding: const EdgeInsets.all(SweetsSpacing.padding),
                    itemCount: _cartItems.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: SweetsSpacing.gapSmall),
                    itemBuilder: (context, index) {
                      final item = _cartItems[index];
                      return _CartItemWidget(
                        item: item,
                        onIncrement: () => _updateQuantity(item.id, 1),
                        onDecrement: () => _updateQuantity(item.id, -1),
                        onDelete: () => _removeItem(item.id),
                      );
                    },
                  ),
          ),
          
          // Bottom navigation bar - using reusable widget
          SweetsBottomNavBar(
            currentIndex: 3, // Cart is at index 3
            onTap: (index) {
              // TODO: Navigate to corresponding screen
              // Example: Navigator.pushNamed(context, routes[index]);
            },
          ),
        ],
      ),
    );
  }
}

/// Cart item widget with interactive quantity controls
class _CartItemWidget extends StatelessWidget {
  final CartItem item;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onDelete;

  const _CartItemWidget({
    required this.item,
    required this.onIncrement,
    required this.onDecrement,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(SweetsSpacing.padding),
      decoration: BoxDecoration(
        color: SweetsColors.white,
        borderRadius: BorderRadius.circular(SweetsSpacing.radiusLarge + 4),
        border: Border.all(
          color: SweetsColors.border.withOpacity(0.75),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A343A40),
            offset: Offset(0, 6),
            blurRadius: 12,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product image
          ClipRRect(
            borderRadius: BorderRadius.circular(SweetsSpacing.radiusMedium),
            child: Image.asset(
              item.imageUrl,
              width: 102,
              height: 102,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 102,
                  height: 102,
                  decoration: BoxDecoration(
                    color: SweetsColors.grayLighter,
                    borderRadius: BorderRadius.circular(SweetsSpacing.radiusMedium),
                  ),
                  child: const Icon(
                    Icons.image,
                    size: 40,
                    color: SweetsColors.gray,
                  ),
                );
              },
            ),
          ),
          const SizedBox(width: SweetsSpacing.gap),
          
          // Product details - using Column instead of Stack
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        item.title,
                        style: const TextStyle(
                          fontFamily: 'Geist',
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          height: 18 / 18,
                          letterSpacing: -0.36,
                          color: SweetsColors.black,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    GestureDetector(
                      onTap: onDelete,
                      child: const Padding(
                        padding: EdgeInsets.all(4),
                        child: Icon(
                          Icons.delete_outline,
                          size: 20,
                          color: SweetsColors.grayDarker,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: SweetsSpacing.gap),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Price : \$${item.price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontFamily: 'Geist',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        height: 20 / 14,
                        color: SweetsColors.grayDarker,
                      ),
                    ),
                    
                    // Quantity controls
                    Row(
                      children: [
                        const Text(
                          'Qty : ',
                          style: TextStyle(
                            fontFamily: 'Geist',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            height: 20 / 14,
                            color: SweetsColors.grayDark,
                          ),
                        ),
                        GestureDetector(
                          onTap: onDecrement,
                          child: Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              color: SweetsColors.grayLighter,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const Icon(
                              Icons.remove,
                              size: 16,
                              color: SweetsColors.grayDarker,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: SweetsSpacing.gapSmall),
                          child: Text(
                            item.quantity.toString().padLeft(2, '0'),
                            style: const TextStyle(
                              fontFamily: 'Geist',
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              height: 20 / 14,
                              color: SweetsColors.grayDarker,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: onIncrement,
                          child: Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              color: SweetsColors.primary,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const Icon(
                              Icons.add,
                              size: 16,
                              color: SweetsColors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: SweetsSpacing.gap),
                
                // Complete order button
                InkWell(
                  onTap: () {
                    // Navigate to checkout
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: SweetsSpacing.padding,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: SweetsColors.primary),
                      borderRadius: BorderRadius.circular(SweetsSpacing.radiusMedium),
                    ),
                    child: const Text(
                      'Complete order',
                      style: TextStyle(
                        fontFamily: 'Geist',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        height: 20 / 14,
                        color: SweetsColors.primary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Cart item model
class CartItem {
  final String id;
  final String title;
  final double price;
  final int quantity;
  final String imageUrl;

  CartItem({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
    required this.imageUrl,
  });

  CartItem copyWith({
    String? id,
    String? title,
    double? price,
    int? quantity,
    String? imageUrl,
  }) {
    return CartItem(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
