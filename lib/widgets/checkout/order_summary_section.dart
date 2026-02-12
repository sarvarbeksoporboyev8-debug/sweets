import 'package:flutter/material.dart';
import '../../theme/sweets_theme.dart';
import '../../models/checkout_item_model.dart';
import 'order_item_card.dart';
import 'pricing_breakdown.dart';

/// Reusable widget for displaying order summary section
class OrderSummarySection extends StatelessWidget {
  const OrderSummarySection({
    super.key,
    required this.items,
    required this.subtotal,
    required this.deliveryCost,
    required this.tax,
    this.paymentMethod,
    this.deliveryAddress,
    this.deliveryCity,
    this.onQuantityChange,
  });

  final List<CheckoutItem> items;
  final double subtotal;
  final double deliveryCost;
  final double tax;
  final String? paymentMethod;
  final String? deliveryAddress;
  final String? deliveryCity;
  final Function(int index, int quantity)? onQuantityChange;

  double get total => subtotal + deliveryCost + tax;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(36),
      decoration: BoxDecoration(
        color: SweetsColors.grayLighter.withOpacity(0.5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Your order',
                style: TextStyle(
                  fontFamily: 'Geist',
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  height: 24 / 24,
                  letterSpacing: -0.72,
                  color: SweetsColors.black,
                ),
              ),
              Row(
                children: [
                  Text(
                    _formatDate(DateTime.now()),
                    style: const TextStyle(
                      fontFamily: 'Geist',
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      height: 16 / 12,
                      color: SweetsColors.gray,
                    ),
                  ),
                  const Text(
                    ' - ',
                    style: TextStyle(
                      fontFamily: 'Geist',
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      height: 16 / 12,
                      color: SweetsColors.gray,
                    ),
                  ),
                  Text(
                    _formatTime(DateTime.now()),
                    style: const TextStyle(
                      fontFamily: 'Geist',
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      height: 16 / 12,
                      color: SweetsColors.gray,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Row(
            children: [
              Icon(
                Icons.inventory_2_outlined,
                size: 16,
                color: SweetsColors.grayDarker,
              ),
              SizedBox(width: 4),
              Text(
                'Products',
                style: TextStyle(
                  fontFamily: 'Geist',
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  height: 20 / 14,
                  color: SweetsColors.grayDarker,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...items.asMap().entries.map((entry) {
            final index = entry.key;
            final item = entry.value;
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: OrderItemCard(
                item: item,
                onQuantityChange: onQuantityChange != null
                    ? (qty) => onQuantityChange!(index, qty)
                    : null,
                showControls: onQuantityChange != null,
              ),
            );
          }),
          PricingBreakdown(
            label: 'Total',
            value: '\$${subtotal.toStringAsFixed(2)}',
          ),
          const Divider(color: SweetsColors.border),
          const SizedBox(height: 12),
          if (paymentMethod != null) ...[
            PricingBreakdown(
              label: 'Payment method',
              value: paymentMethod!,
            ),
            const Divider(color: SweetsColors.border),
            const SizedBox(height: 12),
          ],
          PricingBreakdown(
            label: 'Delivery cost',
            value: '\$${deliveryCost.toStringAsFixed(2)}',
          ),
          const Divider(color: SweetsColors.border),
          const SizedBox(height: 12),
          PricingBreakdown(
            label: 'Tax',
            value: '\$${tax.toStringAsFixed(2)}',
          ),
          if (deliveryAddress != null && deliveryCity != null) ...[
            const SizedBox(height: 16),
            Row(
              children: [
                const Icon(
                  Icons.location_on,
                  size: 16,
                  color: SweetsColors.grayDarker,
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        deliveryAddress!,
                        style: const TextStyle(
                          fontFamily: 'Geist',
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          height: 20 / 14,
                          color: SweetsColors.grayDarker,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        deliveryCity!,
                        style: const TextStyle(
                          fontFamily: 'Geist',
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          height: 16 / 12,
                          color: SweetsColors.grayDark,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')} / ${date.month.toString().padLeft(2, '0')} / ${date.year}';
  }

  String _formatTime(DateTime time) {
    final hour = time.hour > 12 ? time.hour - 12 : time.hour;
    final period = time.hour >= 12 ? 'PM' : 'AM';
    return '${hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')} $period';
  }
}
