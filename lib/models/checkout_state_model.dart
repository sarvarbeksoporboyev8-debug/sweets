import 'checkout_item_model.dart';

/// Model class for overall checkout state
class CheckoutState {
  final String? selectedAddressId;
  final String? selectedDeliveryId;
  final String? selectedPaymentMethodId;
  final List<CheckoutItem> items;
  final bool isProcessing;
  final String? errorMessage;

  CheckoutState({
    this.selectedAddressId,
    this.selectedDeliveryId,
    this.selectedPaymentMethodId,
    required this.items,
    this.isProcessing = false,
    this.errorMessage,
  });

  /// Calculate subtotal from all items
  double get subtotal => items.fold(0, (sum, item) => sum + item.totalPrice);

  /// Create a copy of this state with optional changes
  CheckoutState copyWith({
    String? selectedAddressId,
    String? selectedDeliveryId,
    String? selectedPaymentMethodId,
    List<CheckoutItem>? items,
    bool? isProcessing,
    String? errorMessage,
  }) {
    return CheckoutState(
      selectedAddressId: selectedAddressId ?? this.selectedAddressId,
      selectedDeliveryId: selectedDeliveryId ?? this.selectedDeliveryId,
      selectedPaymentMethodId:
          selectedPaymentMethodId ?? this.selectedPaymentMethodId,
      items: items ?? this.items,
      isProcessing: isProcessing ?? this.isProcessing,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
