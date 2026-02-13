import 'package:flutter/foundation.dart';
import '../models/address_model.dart';
import '../models/payment_method_model.dart';

/// Checkout state provider
class CheckoutProvider with ChangeNotifier {
  Address? _deliveryAddress;
  PaymentMethod? _paymentMethod;
  String? _paymentInfo;
  String? _orderNotes;
  String? _deliveryTime;
  
  Address? get deliveryAddress => _deliveryAddress;
  PaymentMethod? get paymentMethod => _paymentMethod;
  String? get paymentInfo => _paymentInfo;
  String? get orderNotes => _orderNotes;
  String? get deliveryTime => _deliveryTime;

  bool get hasDeliveryAddress => _deliveryAddress != null;
  bool get hasPaymentMethod => _paymentMethod != null;
  bool get isReadyForCheckout => _deliveryAddress != null;

  /// Set delivery address
  void setDeliveryAddress(Address address) {
    _deliveryAddress = address;
    notifyListeners();
  }

  /// Set payment method
  void setPaymentMethod(PaymentMethod method) {
    _paymentMethod = method;
    notifyListeners();
  }

  /// Set payment info (card details, etc.)
  void setPaymentInfo(String info) {
    _paymentInfo = info;
    notifyListeners();
  }

  /// Set order notes
  void setOrderNotes(String notes) {
    _orderNotes = notes;
    notifyListeners();
  }

  /// Set delivery time
  void setDeliveryTime(String time) {
    _deliveryTime = time;
    notifyListeners();
  }

  /// Clear checkout state
  void clearCheckout() {
    _deliveryAddress = null;
    _paymentMethod = null;
    _paymentInfo = null;
    _orderNotes = null;
    _deliveryTime = null;
    notifyListeners();
  }

  /// Complete checkout and generate order
  Future<String> completeCheckout() async {
    // Generate order ID
    final orderId = 'ORD${DateTime.now().millisecondsSinceEpoch}';
    
    // In real app, this would send order to backend
    // For now, just return the order ID
    
    return orderId;
  }
}
