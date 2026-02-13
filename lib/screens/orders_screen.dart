import 'package:flutter/material.dart';
import '../models/order_model.dart';
import '../theme/sweets_theme.dart';
import '../constants/colors.dart';
import '../widgets/sweets_home_indicator.dart';
import '../widgets/account/order_card.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  late List<Order> orders;
  late List<List<OrderStatus>> orderStatuses;

  @override
  void initState() {
    super.initState();
    // Initialize with sample orders
    orders = [
      Order(
        id: '1',
        orderNumber: '1234',
        date: 'Nov 13, 2021',
        status: 'Shipped',
        total: 45.99,
        items: [],
        isExpanded: true, // First order expanded by default
      ),
      Order(
        id: '2',
        orderNumber: '1234',
        date: 'Nov 13, 2021',
        status: 'Processing',
        total: 32.50,
        items: [],
        isExpanded: false,
      ),
      Order(
        id: '3',
        orderNumber: '1234',
        date: 'Nov 13, 2021',
        status: 'Delivered',
        total: 78.25,
        items: [],
        isExpanded: false,
      ),
    ];

    // Sample order statuses for each order
    orderStatuses = [
      [
        const OrderStatus(
          title: 'Order placed',
          date: 'Nov 10, 2021 - 10:30 AM',
          isCompleted: true,
        ),
        const OrderStatus(
          title: 'Order confirmation',
          date: 'Nov 10, 2021 - 10:40 AM',
          isCompleted: true,
        ),
        const OrderStatus(
          title: 'Order shipped',
          date: 'Nov 10, 2021 - 11:00 AM',
          isCompleted: true,
          showTrackLink: true,
        ),
        const OrderStatus(
          title: 'Out for delivery',
          date: 'Pending',
          isCompleted: false,
        ),
        const OrderStatus(
          title: 'Order delivered',
          date: 'Pending',
          isCompleted: false,
        ),
      ],
      [
        const OrderStatus(
          title: 'Order placed',
          date: 'Nov 10, 2021 - 10:30 AM',
          isCompleted: true,
        ),
        const OrderStatus(
          title: 'Order confirmation',
          date: 'Nov 10, 2021 - 10:40 AM',
          isCompleted: true,
        ),
        const OrderStatus(
          title: 'Order shipped',
          date: 'Pending',
          isCompleted: false,
        ),
        const OrderStatus(
          title: 'Out for delivery',
          date: 'Pending',
          isCompleted: false,
        ),
        const OrderStatus(
          title: 'Order delivered',
          date: 'Pending',
          isCompleted: false,
        ),
      ],
      [
        const OrderStatus(
          title: 'Order placed',
          date: 'Nov 10, 2021 - 10:30 AM',
          isCompleted: true,
        ),
        const OrderStatus(
          title: 'Order confirmation',
          date: 'Nov 10, 2021 - 10:40 AM',
          isCompleted: true,
        ),
        const OrderStatus(
          title: 'Order shipped',
          date: 'Nov 10, 2021 - 11:00 AM',
          isCompleted: true,
        ),
        const OrderStatus(
          title: 'Out for delivery',
          date: 'Nov 11, 2021 - 2:00 PM',
          isCompleted: true,
        ),
        const OrderStatus(
          title: 'Order delivered',
          date: 'Nov 11, 2021 - 4:30 PM',
          isCompleted: true,
        ),
      ],
    ];
  }

  void _toggleOrderExpansion(int index) {
    setState(() {
      orders[index] = orders[index].copyWith(
        isExpanded: !orders[index].isExpanded,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SweetsColors.white, // Creamy background
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // White background header (no gradient)
            Container(
              color: SweetsColors.kTopBar, // Pure white
              child: Column(
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
                ],
              ),
            ),
            // Orders list
            Expanded(
              child: orders.isEmpty
                  ? _buildEmptyState()
                  : ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: orders.length,
                      separatorBuilder: (context, index) => const SizedBox(height: 8),
                      itemBuilder: (context, index) {
                        return OrderCard(
                          order: orders[index],
                          statuses: orderStatuses[index],
                          onToggleExpand: () => _toggleOrderExpansion(index),
                          onTrackOrder: () {
                            Navigator.of(context).pushNamed('/trackOrder');
                          },
                        );
                      },
                    ),
            ),
            const SweetsHomeIndicator(),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_bag_outlined,
            size: 64,
            color: SweetsColors.gray.withOpacity(0.5),
          ),
          const SizedBox(height: 16),
          const Text(
            'No orders yet',
            style: TextStyle(
              fontFamily: 'Geist',
              fontWeight: FontWeight.w500,
              fontSize: 18,
              height: 24 / 18,
              color: SweetsColors.grayDark,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Start shopping to see your orders here',
            style: TextStyle(
              fontFamily: 'Geist',
              fontWeight: FontWeight.w400,
              fontSize: 14,
              height: 20 / 14,
              color: SweetsColors.gray,
            ),
          ),
        ],
      ),
    );
  }
}
