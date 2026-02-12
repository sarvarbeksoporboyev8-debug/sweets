import 'package:flutter/material.dart';
import 'dart:ui';
import '../theme/sweets_theme.dart';
import '../widgets/sweets_home_indicator.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final Map<String, List<_NotificationItem>> _notifications = {
    'Today': [
      _NotificationItem(
        title: 'Product ordered successfully',
        message: 'Products ordered successfully. The driver will contact you and deliver your order.',
        time: '2 hours',
        isRead: false,
        hasDelete: true,
      ),
      _NotificationItem(
        title: 'Product added to the cart',
        message: 'Products added to the cart successfully.',
        time: '2 hours',
        isRead: true,
        hasMarkAsRead: true,
      ),
      _NotificationItem(
        title: 'Product received successfully',
        message: 'You have successfully received your product. Please add a review for the product. Add your review now.',
        time: '2 hours',
        isRead: false,
      ),
      _NotificationItem(
        title: 'Payment successful',
        message: 'Payment completed successfully. The driver will contact you and deliver your order.',
        time: '2 hours',
        isRead: false,
      ),
    ],
    'Yesterday': [
      _NotificationItem(
        title: 'Product ordered successfully',
        message: 'Products ordered successfully. The driver will contact you and deliver your order.',
        time: '2 hours',
        isRead: false,
      ),
      _NotificationItem(
        title: 'Product added to the cart',
        message: 'Products added to the cart successfully.',
        time: '2 hours',
        isRead: false,
      ),
      _NotificationItem(
        title: 'Product received successfully',
        message: 'You have successfully received your product. Please add a review for the product. Add your review now.',
        time: '2 hours',
        isRead: false,
      ),
      _NotificationItem(
        title: 'Payment successful',
        message: 'Payment completed successfully. The driver will contact you and deliver your order.',
        time: '2 hours',
        isRead: false,
      ),
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SweetsColors.white,
      body: Stack(
        children: [
          // Gradient background
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Container(
              height: 168,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFFFE6D1),
                    Color(0xFFFFFFFF),
                  ],
                ),
              ),
            ),
          ),
          // Main content
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 10, 16, 40),
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
                        const SizedBox(width: 8),
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
                    const SizedBox(height: 8),
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
                            const SizedBox(width: 4),
                            Container(
                              width: 28,
                              height: 28,
                              decoration: BoxDecoration(
                                color: SweetsColors.primaryLighter,
                                shape: BoxShape.circle,
                              ),
                              child: const Center(
                                child: Text(
                                  '20',
                                  style: TextStyle(
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
                          onTap: () {
                            // TODO: Mark all as read
                          },
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
                    const SizedBox(height: 8),
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
                          const SizedBox(height: 8),
                          ...entry.value.map((notification) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: _NotificationCard(
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
                          const SizedBox(height: 16),
                        ],
                      );
                    }).toList(),
                  ],
                ),
              ),
            ),
          ),
          // Home indicator
          const Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: SweetsHomeIndicator(),
          ),
        ],
      ),
    );
  }
}

class _NotificationItem {
  _NotificationItem({
    required this.title,
    required this.message,
    required this.time,
    this.isRead = false,
    this.hasDelete = false,
    this.hasMarkAsRead = false,
  });

  final String title;
  final String message;
  final String time;
  bool isRead;
  final bool hasDelete;
  final bool hasMarkAsRead;
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
      padding: const EdgeInsets.symmetric(vertical: 8),
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
              const SizedBox(width: 4),
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

class _NotificationCard extends StatelessWidget {
  const _NotificationCard({
    required this.notification,
    required this.onDelete,
    required this.onMarkAsRead,
  });

  final _NotificationItem notification;
  final VoidCallback onDelete;
  final VoidCallback onMarkAsRead;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(notification.title),
      direction: DismissDirection.horizontal,
      background: notification.hasDelete
          ? Container(
              decoration: BoxDecoration(
                color: const Color(0xFFFA5252),
                borderRadius: BorderRadius.circular(16),
              ),
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 16),
              child: const Icon(
                Icons.delete_outline,
                color: SweetsColors.white,
                size: 24,
              ),
            )
          : notification.hasMarkAsRead
              ? Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF82C91E),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 16),
                  child: const Icon(
                    Icons.check_circle_outline,
                    color: SweetsColors.white,
                    size: 24,
                  ),
                )
              : null,
      secondaryBackground: notification.hasMarkAsRead
          ? Container(
              decoration: BoxDecoration(
                color: const Color(0xFF82C91E),
                borderRadius: BorderRadius.circular(16),
              ),
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 16),
              child: const Icon(
                Icons.check_circle_outline,
                color: SweetsColors.white,
                size: 24,
              ),
            )
          : null,
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart && notification.hasDelete) {
          onDelete();
        } else if (direction == DismissDirection.startToEnd && notification.hasMarkAsRead) {
          onMarkAsRead();
        }
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: SweetsColors.grayLighter.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
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
                  const SizedBox(height: 4),
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
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        size: 16,
                        color: SweetsColors.grayDark,
                      ),
                      const SizedBox(width: 4),
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
}
