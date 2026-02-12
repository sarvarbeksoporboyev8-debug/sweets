import 'package:flutter/material.dart';
import '../theme/sweets_theme.dart';
import '../widgets/sweets_home_indicator.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  int? expandedOrderIndex = 0; // First order expanded by default

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SweetsColors.white,
      body: Stack(
        children: [
          // Main content
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Navigation bar
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: Row(
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
                          'Orders',
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
                  ),
                  const SizedBox(height: 20),
                  // Title
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Orders',
                      style: TextStyle(
                        fontFamily: 'Geist',
                        fontWeight: FontWeight.w600,
                        fontSize: 32,
                        height: 32 / 32,
                        letterSpacing: -0.96,
                        color: SweetsColors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Orders list
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          _OrderCard(
                            orderNumber: '1234',
                            orderDate: 'Nov 13, 2021',
                            isExpanded: expandedOrderIndex == 0,
                            onTap: () {
                              setState(() {
                                expandedOrderIndex = expandedOrderIndex == 0 ? null : 0;
                              });
                            },
                          ),
                          const SizedBox(height: 8),
                          _OrderCard(
                            orderNumber: '1234',
                            orderDate: 'Nov 13, 2021',
                            isExpanded: expandedOrderIndex == 1,
                            onTap: () {
                              setState(() {
                                expandedOrderIndex = expandedOrderIndex == 1 ? null : 1;
                              });
                            },
                          ),
                          const SizedBox(height: 8),
                          _OrderCard(
                            orderNumber: '1234',
                            orderDate: 'Nov 13, 2021',
                            isExpanded: expandedOrderIndex == 2,
                            onTap: () {
                              setState(() {
                                expandedOrderIndex = expandedOrderIndex == 2 ? null : 2;
                              });
                            },
                          ),
                          const SizedBox(height: 100),
                        ],
                      ),
                    ),
                  ),
                ],
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

class _OrderCard extends StatelessWidget {
  const _OrderCard({
    required this.orderNumber,
    required this.orderDate,
    required this.isExpanded,
    required this.onTap,
  });

  final String orderNumber;
  final String orderDate;
  final bool isExpanded;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
              decoration: BoxDecoration(
                color: SweetsColors.primaryLighter,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.shopping_bag,
                color: SweetsColors.primary,
                size: 24,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order number $orderNumber',
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
                    'Order date: $orderDate',
                    style: const TextStyle(
                      fontFamily: 'Geist',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      height: 20 / 14,
                      color: SweetsColors.gray,
                    ),
                  ),
                  if (isExpanded) ...[
                    const SizedBox(height: 8),
                    _OrderTimeline(),
                  ],
                ],
              ),
            ),
            const SizedBox(width: 8),
            Transform.rotate(
              angle: isExpanded ? 1.5708 : 0, // 90 degrees when expanded
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

class _OrderTimeline extends StatelessWidget {
  const _OrderTimeline();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TimelineItem(
          title: 'Order placed',
          date: 'Nov 10, 2021 - 10:30 AM',
          isCompleted: true,
        ),
        const Divider(color: SweetsColors.border),
        _TimelineItem(
          title: 'Order confirmation',
          date: 'Nov 10, 2021 - 10:40 AM',
          isCompleted: true,
        ),
        const Divider(color: SweetsColors.border),
        _TimelineItem(
          title: 'Order shipped',
          date: 'Nov 10, 2021 - 11:00 AM',
          isCompleted: true,
          showTrackLink: true,
        ),
        const Divider(color: SweetsColors.border),
        _TimelineItem(
          title: 'Out for delivery',
          date: 'Pending',
          isCompleted: false,
        ),
        const Divider(color: SweetsColors.border),
        _TimelineItem(
          title: 'Order delivered',
          date: 'Pending',
          isCompleted: false,
        ),
      ],
    );
  }
}

class _TimelineItem extends StatelessWidget {
  const _TimelineItem({
    required this.title,
    required this.date,
    required this.isCompleted,
    this.showTrackLink = false,
  });

  final String title;
  final String date;
  final bool isCompleted;
  final bool showTrackLink;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isCompleted)
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
                        title,
                        style: TextStyle(
                          fontFamily: 'Geist',
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          height: 20 / 14,
                          color: isCompleted
                              ? SweetsColors.grayDark
                              : SweetsColors.gray,
                        ),
                      ),
                    ),
                    if (showTrackLink)
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('/trackOrder');
                        },
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
                  date,
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
