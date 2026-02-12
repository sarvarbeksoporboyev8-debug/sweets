import 'package:flutter/material.dart';
import '../../models/order_model.dart';
import '../../theme/sweets_theme.dart';

/// Order status indicator component - displays timeline of order statuses
class OrderStatusIndicator extends StatelessWidget {
  const OrderStatusIndicator({
    super.key,
    required this.statuses,
    this.onTrackOrder,
  });

  final List<OrderStatus> statuses;
  final VoidCallback? onTrackOrder;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < statuses.length; i++) ...[
          _TimelineItem(
            status: statuses[i],
            onTrackOrder: onTrackOrder,
          ),
          if (i < statuses.length - 1)
            const Divider(color: SweetsColors.border),
        ],
      ],
    );
  }
}

class _TimelineItem extends StatelessWidget {
  const _TimelineItem({
    required this.status,
    this.onTrackOrder,
  });

  final OrderStatus status;
  final VoidCallback? onTrackOrder;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (status.isCompleted)
            const Icon(
              Icons.check_circle,
              size: 20,
              color: Color(0xFF82C91E),
            )
          else
            const SizedBox(width: 20),
          const SizedBox(width: 4),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        status.title,
                        style: TextStyle(
                          fontFamily: 'Geist',
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          height: 20 / 14,
                          color: status.isCompleted
                              ? SweetsColors.grayDark
                              : SweetsColors.gray,
                        ),
                      ),
                    ),
                    if (status.showTrackLink && onTrackOrder != null)
                      GestureDetector(
                        onTap: onTrackOrder,
                        child: const Text(
                          'Track my order',
                          style: TextStyle(
                            fontFamily: 'Geist',
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            height: 16 / 12,
                            color: SweetsColors.primary,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  status.date,
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
          ),
        ],
      ),
    );
  }
}
