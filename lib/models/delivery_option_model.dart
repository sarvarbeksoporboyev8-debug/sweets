/// Model class for delivery options
class DeliveryOption {
  final String id;
  final String label;
  final String description;
  final double cost;
  final String estimatedTime;
  bool isSelected;

  DeliveryOption({
    required this.id,
    required this.label,
    required this.description,
    required this.cost,
    required this.estimatedTime,
    this.isSelected = false,
  });

  /// Create a copy of this delivery option with optional changes
  DeliveryOption copyWith({bool? isSelected}) {
    return DeliveryOption(
      id: id,
      label: label,
      description: description,
      cost: cost,
      estimatedTime: estimatedTime,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
