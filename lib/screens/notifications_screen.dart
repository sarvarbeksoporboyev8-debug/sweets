import 'package:flutter/material.dart';
import '../theme/sweets_theme.dart';
import '../constants/colors.dart';
import '../widgets/sweets_home_indicator.dart';
import '../widgets/support/notification_item.dart';
import '../models/notification_model.dart';
import '../constants/spacing.dart';
import '../constants/gradients.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final Map<String, List<NotificationModel>> _notifications = {
    'Today': [
      NotificationModel(
        id: '1',
        title: 'Product ordered successfully',
        message:
            'Products ordered successfully. The driver will contact you and deliver your order.',
        time: '2 hours',
        isRead: false,
        hasDelete: true,
      ),
      NotificationModel(
        id: '2',
        title: 'Product added to the cart',
        message: 'Products added to the cart successfully.',
        time: '2 hours',
        isRead: true,
        hasMarkAsRead: true,
      ),
      NotificationModel(
        id: '3',
        title: 'Product received successfully',
        message:
            'You have successfully received your product. Please add a review for the product. Add your review now.',
        time: '2 hours',
        isRead: false,
      ),
      NotificationModel(
        id: '4',
        title: 'Payment successful',
        message:
            'Payment completed successfully. The driver will contact you and deliver your order.',
        time: '2 hours',
        isRead: false,
      ),
    ],
    'Yesterday': [
      NotificationModel(
        id: '5',
        title: 'Product ordered successfully',
        message:
            'Products ordered successfully. The driver will contact you and deliver your order.',
        time: '2 hours',
        isRead: false,
      ),
      NotificationModel(
        id: '6',
        title: 'Product added to the cart',
        message: 'Products added to the cart successfully.',
        time: '2 hours',
        isRead: false,
      ),
      NotificationModel(
        id: '7',
        title: 'Product received successfully',
        message:
            'You have successfully received your product. Please add a review for the product. Add your review now.',
        time: '2 hours',
        isRead: false,
      ),
      NotificationModel(
        id: '8',
        title: 'Payment successful',
        message:
            'Payment completed successfully. The driver will contact you and deliver your order.',
        time: '2 hours',
        isRead: false,
      ),
    ],
  };

  int get _totalNotifications {
    return _notifications.values.fold(0, (sum, list) => sum + list.length);
  }

  void _markAllAsRead() {
    setState(() {
      for (var list in _notifications.values) {
        for (var notification in list) {
          notification.isRead = true;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SweetsColors.white, // White background
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(
                  Spacing.lg,
                  10,
                  Spacing.lg,
                  40,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Navigation bar
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 20,
                            color: SweetsColors.grayDarker,
                          ),
                        ),
                        const SizedBox(width: Spacing.sm),
                        const Text(
                          'Notifications',
                          style: TextStyle(
                            fontFamily: 'Geist',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            height: 20 / 14,
                            color: SweetsColors.grayDarker,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: Spacing.sm),
                    // Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Notifications',
                              style: TextStyle(
                                fontFamily: 'Geist',
                                fontWeight: FontWeight.w600,
                                fontSize: 32,
                                height: 32 / 32,
                                letterSpacing: -0.96,
                                color: SweetsColors.black,
                              ),
                            ),
                            const SizedBox(width: Spacing.xs),
                            Container(
                              width: 28,
                              height: 28,
                              decoration: BoxDecoration(
                                color: SweetsColors.kAccentGold, // Gold accent
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(
                                  '$_totalNotifications',
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
                        GestureDetector(
                          onTap: _markAllAsRead,
                          child: const Text(
                            'Mark as read',
                            style: TextStyle(
                              fontFamily: 'Geist',
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              height: 20 / 14,
                              color: SweetsColors.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: Spacing.sm),
                    // Notifications list
                    ..._notifications.entries.map((entry) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _DateHeader(
                            date: entry.key,
                            count: entry.value.length,
                            fullDate: 'Nov 13, 2021, 10:00 AM',
                          ),
                          const SizedBox(height: Spacing.sm),
                          ...entry.value.map((notification) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                bottom: Spacing.md,
                              ),
                              child: NotificationItem(
                                notification: notification,
                                onDelete: () {
                                  setState(() {
                                    entry.value.remove(notification);
                                    if (entry.value.isEmpty) {
                                      _notifications.remove(entry.key);
                                    }
                                  });
                                },
                                onMarkAsRead: () {
                                  setState(() {
                                    notification.isRead = true;
                                  });
                                },
                              ),
                            );
                          }),
                          const SizedBox(height: Spacing.lg),
                        ],
                      );
                    }).toList(),
                  ],
                ),
              ),
            ),
          ],
          // Home indicator
          const SweetsHomeIndicator(),
        ),
      ),
    );
  }
}

class _DateHeader extends StatelessWidget {
  const _DateHeader({
    required this.date,
    required this.count,
    required this.fullDate,
  });

  final String date;
  final int count;
  final String fullDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Spacing.sm),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                date,
                style: const TextStyle(
                  fontFamily: 'Geist',
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  height: 16 / 12,
                  color: SweetsColors.grayDark,
                ),
              ),
              const SizedBox(width: Spacing.xs),
              Text(
                '$count Notifications',
                style: const TextStyle(
                  fontFamily: 'Geist',
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  height: 16 / 12,
                  color: SweetsColors.primary,
                ),
              ),
            ],
          ),
          Text(
            fullDate,
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
    );
  }
}
