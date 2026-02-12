import 'package:flutter/material.dart';
import '../theme/sweets_theme.dart';
import '../widgets/sweets_home_indicator.dart';
import '../widgets/sweets_button.dart';
import '../widgets/sweets_checkout_stepper.dart';

class CheckoutOrderSummaryScreen extends StatelessWidget {
  const CheckoutOrderSummaryScreen({super.key});

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
                          Container(
                            padding: const EdgeInsets.all(36),
                            decoration: BoxDecoration(
                              color: SweetsColors.grayLighter.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Your order',
                                      style: TextStyle(
                                        fontFamily: 'Geist',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 24,
                                        height: 24 / 24,
                                        letterSpacing: -0.72,
                                        color: SweetsColors.black,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          '12 / 12 /2024',
                                          style: TextStyle(
                                            fontFamily: 'Geist',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            height: 16 / 12,
                                            color: SweetsColors.gray,
                                          ),
                                        ),
                                        const Text(
                                          ' - ',
                                          style: TextStyle(
                                            fontFamily: 'Geist',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            height: 16 / 12,
                                            color: SweetsColors.gray,
                                          ),
                                        ),
                                        const Text(
                                          '17:00 PM',
                                          style: TextStyle(
                                            fontFamily: 'Geist',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            height: 16 / 12,
                                            color: SweetsColors.gray,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.inventory_2_outlined,
                                      size: 16,
                                      color: SweetsColors.grayDarker,
                                    ),
                                    const SizedBox(width: 4),
                                    const Text(
                                      'Products',
                                      style: TextStyle(
                                        fontFamily: 'Geist',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        height: 20 / 14,
                                        color: SweetsColors.grayDarker,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                _OrderItem(
                                  name: 'Fruit tart',
                                  quantity: 10,
                                  price: '\$50.00',
                                ),
                                const SizedBox(height: 8),
                                _OrderItem(
                                  name: 'Donuts',
                                  quantity: 10,
                                  price: '\$50.00',
                                ),
                                const SizedBox(height: 8),
                                _OrderItem(
                                  name: 'Blueberry Pie',
                                  quantity: 10,
                                  price: '\$50.00',
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Total',
                                      style: TextStyle(
                                        fontFamily: 'Geist',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        height: 16 / 12,
                                        color: SweetsColors.grayDark,
                                      ),
                                    ),
                                    const Text(
                                      '\$150.00',
                                      style: TextStyle(
                                        fontFamily: 'Geist',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        height: 20 / 14,
                                        color: SweetsColors.grayDarker,
                                      ),
                                    ),
                                  ],
                                ),
                                const Divider(color: SweetsColors.border),
                                const SizedBox(height: 12),
                                _SummaryRow(
                                  label: 'Payment method',
                                  value: 'Apple Pay',
                                ),
                                const Divider(color: SweetsColors.border),
                                const SizedBox(height: 12),
                                _SummaryRow(
                                  label: 'Delivery cost',
                                  value: '\$20.00',
                                ),
                                const Divider(color: SweetsColors.border),
                                const SizedBox(height: 12),
                                _SummaryRow(
                                  label: 'Tax',
                                  value: '\$5.00',
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on,
                                      size: 16,
                                      color: SweetsColors.grayDarker,
                                    ),
                                    const SizedBox(width: 4),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            '3600 Maple Street',
                                            style: TextStyle(
                                              fontFamily: 'Geist',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              height: 20 / 14,
                                              color: SweetsColors.grayDarker,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          const Text(
                                            'Santa Ana, California, Zip code: 92705',
                                            style: TextStyle(
                                              fontFamily: 'Geist',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                              height: 16 / 12,
                                              color: SweetsColors.grayDark,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
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
          // Bottom summary and button
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
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
                  _SummaryRow(
                    label: 'Products',
                    value: '\$150.00',
                  ),
                  const SizedBox(height: 4),
                  _SummaryRow(
                    label: 'Delivery',
                    value: '\$20.00',
                  ),
                  const SizedBox(height: 4),
                  _SummaryRow(
                    label: 'Tax',
                    value: '\$5.00',
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total',
                        style: TextStyle(
                          fontFamily: 'Geist',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          height: 24 / 16,
                          color: SweetsColors.gray,
                        ),
                      ),
                      const Text(
                        '\$175.00',
                        style: TextStyle(
                          fontFamily: 'Geist',
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                          height: 24 / 24,
                          letterSpacing: -0.72,
                          color: SweetsColors.grayDarker,
                        ),
                      ),
                    ],
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
          ),
        ],
      ),
    );
  }
}

class _OrderItem extends StatelessWidget {
  const _OrderItem({
    required this.name,
    required this.quantity,
    required this.price,
  });

  final String name;
  final int quantity;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            name,
            style: const TextStyle(
              fontFamily: 'Geist',
              fontWeight: FontWeight.w400,
              fontSize: 12,
              height: 16 / 12,
              color: SweetsColors.grayDark,
            ),
          ),
        ),
        Expanded(
          child: Text(
            'Qty : $quantity',
            style: const TextStyle(
              fontFamily: 'Geist',
              fontWeight: FontWeight.w400,
              fontSize: 12,
              height: 16 / 12,
              color: SweetsColors.grayDarker,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: Text(
            price,
            style: const TextStyle(
              fontFamily: 'Geist',
              fontWeight: FontWeight.w500,
              fontSize: 14,
              height: 20 / 14,
              color: SweetsColors.grayDarker,
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'Geist',
            fontWeight: FontWeight.w400,
            fontSize: 12,
            height: 16 / 12,
            color: SweetsColors.grayDark,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontFamily: 'Geist',
            fontWeight: FontWeight.w500,
            fontSize: 14,
            height: 20 / 14,
            color: SweetsColors.grayDarker,
          ),
        ),
      ],
    );
  }
}
