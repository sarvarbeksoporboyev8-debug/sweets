import 'package:flutter/material.dart';
import '../../theme/sweets_theme.dart';
import '../../models/notification_model.dart';
import '../../constants/spacing.dart';

/// Reusable notification item card with dismiss functionality
class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
    required this.notification,
    required this.onDelete,
    required this.onMarkAsRead,
  });

  final NotificationModel notification;
  final VoidCallback onDelete;
  final VoidCallback onMarkAsRead;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(notification.id),
      direction: DismissDirection.horizontal,
      background: notification.hasDelete
          ? _buildDeleteBackground()
          : notification.hasMarkAsRead
              ? _buildMarkAsReadBackground()
              : null,
      secondaryBackground: notification.hasMarkAsRead
          ? _buildMarkAsReadBackground()
          : null,
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart && notification.hasDelete) {
          onDelete();
        } else if (direction == DismissDirection.startToEnd &&
            notification.hasMarkAsRead) {
          onMarkAsRead();
        }
      },
      child: Container(
        padding: const EdgeInsets.all(Spacing.cardPadding),
        decoration: BoxDecoration(
          color: SweetsColors.grayLighter.withOpacity(0.5),
          borderRadius: BorderRadius.circular(Spacing.radiusLg),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notification.title,
                    style: const TextStyle(
                      fontFamily: 'Geist',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      height: 20 / 14,
                      color: SweetsColors.grayDarker,
                    ),
                  ),
                  const SizedBox(height: Spacing.xs),
                  Text(
                    notification.message,
                    style: const TextStyle(
                      fontFamily: 'Geist',
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      height: 16 / 12,
                      color: SweetsColors.gray,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: Spacing.xs),
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        size: 16,
                        color: SweetsColors.grayDark,
                      ),
                      const SizedBox(width: Spacing.xs),
                      Text(
                        notification.time,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDeleteBackground() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFA5252),
        borderRadius: BorderRadius.circular(Spacing.radiusLg),
      ),
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.only(right: Spacing.lg),
      child: const Icon(
        Icons.delete_outline,
        color: SweetsColors.white,
        size: 24,
      ),
    );
  }

  Widget _buildMarkAsReadBackground() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF82C91E),
        borderRadius: BorderRadius.circular(Spacing.radiusLg),
      ),
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: Spacing.lg),
      child: const Icon(
        Icons.check_circle_outline,
        color: SweetsColors.white,
        size: 24,
      ),
    );
  }
}
