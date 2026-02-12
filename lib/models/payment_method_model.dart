/// Types of payment methods supported
enum PaymentType { card, paypal, applePay, googlePay, wallet, upi, bankTransfer }

/// Model class for payment methods
class PaymentMethod {
  final String id;
  final PaymentType type;
  final String label;
  final String? imageUrl;
  final String? lastFourDigits;
  bool isSelected;

  PaymentMethod({
    required this.id,
    required this.type,
    required this.label,
    this.imageUrl,
    this.lastFourDigits,
    this.isSelected = false,
  });

  /// Create a copy of this payment method with optional changes
  PaymentMethod copyWith({bool? isSelected}) {
    return PaymentMethod(
      id: id,
      type: type,
      label: label,
      imageUrl: imageUrl,
      lastFourDigits: lastFourDigits,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
