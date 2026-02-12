/// Represents delivery confirmation details
class DeliveryConfirmation {
  final String orderId;
  final String deliveredTime;
  final String? deliveryPhotos;
  final String? notes;
  final bool canRate;

  DeliveryConfirmation({
    required this.orderId,
    required this.deliveredTime,
    this.deliveryPhotos,
    this.notes,
    this.canRate = true,
  });
}
