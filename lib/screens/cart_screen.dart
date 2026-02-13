import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../theme/sweets_theme.dart';
import '../constants/colors.dart';
import '../constants/spacing.dart';
import '../widgets/sweets_home_indicator.dart';
import '../widgets/sweets_bottom_nav_bar.dart';

/// Cart screen with dynamic state management and responsive layout.
/// Demonstrates proper layout without Stack/Positioned abuse.
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();
    
    return Scaffold(
      backgroundColor: SweetsColors.white, // White background
      body: Column(
        children: [
          // White header background (no gradient)
          Container(
            color: SweetsColors.kTopBar, // Pure white
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
                              decoration: BoxDecoration(
                                color: SweetsColors.kAccentGold, // Gold accent
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(
                                  cart.itemCount.toString(),
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
                        if (cart.isNotEmpty)
                          GestureDetector(
                            onTap: () => cart.clear(),
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
            child: cart.isEmpty
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
                    itemCount: cart.items.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: SweetsSpacing.gapSmall),
                    itemBuilder: (context, index) {
                      final item = cart.items[index];
                      return _CartItemWidget(
                        item: item,
                        onIncrement: () => cart.incrementQuantity(item.id),
                        onDecrement: () => cart.decrementQuantity(item.id),
                        onDelete: () => cart.removeItem(item.id),
                      );
                    },
                  ),
          ),
          
          // Bottom navigation bar - using reusable widget
          SweetsBottomNavBar(
            currentIndex: 3, // Cart is at index 3
            onTap: (index) {
              switch (index) {
                case 0:
                  Navigator.pushReplacementNamed(context, '/home');
                  break;
                case 1:
                  Navigator.pushReplacementNamed(context, '/explore');
                  break;
                case 2:
                  Navigator.pushReplacementNamed(context, '/favorites');
                  break;
                case 3:
                  // Already on cart, do nothing
                  break;
                case 4:
                  Navigator.pushReplacementNamed(context, '/account');
                  break;
              }
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
            child: item.imageUrl != null
                ? Image.asset(
                    item.imageUrl!,
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
                  )
                : Container(
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
                    Navigator.pushNamed(context, '/checkoutDeliveryAddress');
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
