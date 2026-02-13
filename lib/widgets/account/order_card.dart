import 'package:flutter/material.dart';
import '../../models/order_model.dart';
import '../../theme/sweets_theme.dart';
import '../../constants/colors.dart';
import 'order_status_indicator.dart';

/// Reusable order card component with expandable timeline
class OrderCard extends StatelessWidget {
  const OrderCard({
    super.key,
    required this.order,
    required this.statuses,
    required this.onToggleExpand,
    this.onTrackOrder,
  });

  final Order order;
  final List<OrderStatus> statuses;
  final VoidCallback onToggleExpand;
  final VoidCallback? onTrackOrder;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onToggleExpand,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: SweetsColors.grayLighter.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: const BoxDecoration(
                color: SweetsColors.cardPurple, // Pastel purple
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.shopping_bag,
                color: SweetsColors.buttonCoral, // Coral icon
                size: 24,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order number ${order.orderNumber}',
                    style: const TextStyle(
                      fontFamily: 'Geist',
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      height: 18 / 18,
                      letterSpacing: -0.36,
                      color: SweetsColors.grayDark,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Order date: ${order.date}',
                    style: const TextStyle(
                      fontFamily: 'Geist',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      height: 20 / 14,
                      color: SweetsColors.gray,
                    ),
                  ),
                  AnimatedSize(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    child: order.isExpanded
                        ? Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: OrderStatusIndicator(
                              statuses: statuses,
                              onTrackOrder: onTrackOrder,
                            ),
                          )
                        : const SizedBox.shrink(),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            AnimatedRotation(
              duration: const Duration(milliseconds: 300),
              turns: order.isExpanded ? 0.25 : 0,
              child: const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 20,
                color: SweetsColors.grayDarker,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
