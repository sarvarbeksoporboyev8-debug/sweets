/// Model class for order data
class Order {
  final String id;
  final String orderNumber;
  final String date;
  final String status;
  final double total;
  final List<OrderItem> items;
  bool isExpanded;

  Order({
    required this.id,
    required this.orderNumber,
    required this.date,
    required this.status,
    required this.total,
    required this.items,
    this.isExpanded = false,
  });

  Order copyWith({
    String? id,
    String? orderNumber,
    String? date,
    String? status,
    double? total,
    List<OrderItem>? items,
    bool? isExpanded,
  }) {
    return Order(
      id: id ?? this.id,
      orderNumber: orderNumber ?? this.orderNumber,
      date: date ?? this.date,
      status: status ?? this.status,
      total: total ?? this.total,
      items: items ?? this.items,
      isExpanded: isExpanded ?? this.isExpanded,
    );
  }
}

/// Model class for order item data
class OrderItem {
  final String productName;
  final int quantity;
  final double price;

  OrderItem({
    required this.productName,
    required this.quantity,
    required this.price,
  });
}

/// Model class for order timeline status
class OrderStatus {
  final String title;
  final String date;
  final bool isCompleted;
  final bool showTrackLink;

  const OrderStatus({
    required this.title,
    required this.date,
    required this.isCompleted,
    this.showTrackLink = false,
  });
}
