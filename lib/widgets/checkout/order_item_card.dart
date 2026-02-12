import 'package:flutter/material.dart';
import '../../theme/sweets_theme.dart';
import '../../models/checkout_item_model.dart';

/// Reusable widget for displaying order items with quantity controls
class OrderItemCard extends StatelessWidget {
  const OrderItemCard({
    super.key,
    required this.item,
    this.onQuantityChange,
    this.showControls = true,
  });

  final CheckoutItem item;
  final Function(int)? onQuantityChange;
  final bool showControls;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            item.name,
            style: const TextStyle(
              fontFamily: 'Geist',
              fontWeight: FontWeight.w400,
              fontSize: 12,
              height: 16 / 12,
              color: SweetsColors.grayDark,
            ),
          ),
        ),
        if (showControls)
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove_circle_outline, size: 16),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: item.quantity > 1
                      ? () => onQuantityChange?.call(item.quantity - 1)
                      : null,
                  color: SweetsColors.grayDarker,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    '${item.quantity}',
                    style: const TextStyle(
                      fontFamily: 'Geist',
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      height: 16 / 12,
                      color: SweetsColors.grayDarker,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add_circle_outline, size: 16),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: () => onQuantityChange?.call(item.quantity + 1),
                  color: SweetsColors.grayDarker,
                ),
              ],
            ),
          )
        else
          Expanded(
            child: Text(
              'Qty : ${item.quantity}',
              style: const TextStyle(
                fontFamily: 'Geist',
                fontWeight: FontWeight.w400,
                fontSize: 12,
                height: 16 / 12,
                color: SweetsColors.grayDarker,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        Expanded(
          child: Text(
            '\$${item.totalPrice.toStringAsFixed(2)}',
            style: const TextStyle(
              fontFamily: 'Geist',
              fontWeight: FontWeight.w500,
              fontSize: 14,
              height: 20 / 14,
              color: SweetsColors.grayDarker,
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}
