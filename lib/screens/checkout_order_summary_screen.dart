import 'package:flutter/material.dart';
import '../theme/sweets_theme.dart';
import '../widgets/sweets_home_indicator.dart';
import '../widgets/sweets_button.dart';
import '../widgets/sweets_checkout_stepper.dart';
import '../models/checkout_item_model.dart';
import '../widgets/checkout/order_summary_section.dart';
import '../widgets/checkout/pricing_breakdown.dart';

class CheckoutOrderSummaryScreen extends StatefulWidget {
  const CheckoutOrderSummaryScreen({super.key});

  @override
  State<CheckoutOrderSummaryScreen> createState() =>
      _CheckoutOrderSummaryScreenState();
}

class _CheckoutOrderSummaryScreenState
    extends State<CheckoutOrderSummaryScreen> {
  late List<CheckoutItem> items;

  @override
  void initState() {
    super.initState();
    items = [
      CheckoutItem(
        id: '1',
        name: 'Fruit tart',
        image: '',
        price: 5.0,
        quantity: 10,
      ),
      CheckoutItem(
        id: '2',
        name: 'Donuts',
        image: '',
        price: 5.0,
        quantity: 10,
      ),
      CheckoutItem(
        id: '3',
        name: 'Blueberry Pie',
        image: '',
        price: 5.0,
        quantity: 10,
      ),
    ];
  }

  double get subtotal => items.fold(0.0, (sum, item) => sum + item.totalPrice);
  double get deliveryCost => 20.0;
  double get tax => 5.0;
  double get total => subtotal + deliveryCost + tax;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SweetsColors.white,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFE6D1),
              Color(0xFFFFFFFF),
            ],
            stops: [0.0, 0.3],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 20,
                      color: SweetsColors.grayDarker,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Checkout',
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
              const SizedBox(height: 24),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: SweetsCheckoutStepper(currentStep: 2),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OrderSummarySection(
                        items: items,
                        subtotal: subtotal,
                        deliveryCost: deliveryCost,
                        tax: tax,
                        paymentMethod: 'Apple Pay',
                        deliveryAddress: '3600 Maple Street',
                        deliveryCity:
                            'Santa Ana, California, Zip code: 92705',
                      ),
                      const SizedBox(height: 100),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: SweetsColors.white,
                  border: Border(
                    top: BorderSide(
                      color: SweetsColors.border.withOpacity(0.25),
                    ),
                  ),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    PricingBreakdown(
                      label: 'Products',
                      value: '\$${subtotal.toStringAsFixed(2)}',
                    ),
                    const SizedBox(height: 4),
                    PricingBreakdown(
                      label: 'Delivery',
                      value: '\$${deliveryCost.toStringAsFixed(2)}',
                    ),
                    const SizedBox(height: 4),
                    PricingBreakdown(
                      label: 'Tax',
                      value: '\$${tax.toStringAsFixed(2)}',
                    ),
                    const SizedBox(height: 4),
                    PricingBreakdown(
                      label: 'Total',
                      value: '\$${total.toStringAsFixed(2)}',
                      isTotal: true,
                    ),
                    const SizedBox(height: 16),
                    SweetsPrimaryButton(
                      label: 'Complete your order',
                      onPressed: () {
                        // TODO: Complete order
                      },
                    ),
                    const SweetsHomeIndicator(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
