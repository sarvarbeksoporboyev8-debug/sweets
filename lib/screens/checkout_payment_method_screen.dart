import 'package:flutter/material.dart';
import '../theme/sweets_theme.dart';
import '../constants/colors.dart';
import '../widgets/sweets_home_indicator.dart';
import '../widgets/sweets_button.dart';
import '../widgets/sweets_checkout_stepper.dart';
import '../widgets/checkout/payment_method_card.dart';

class CheckoutPaymentMethodScreen extends StatefulWidget {
  const CheckoutPaymentMethodScreen({super.key});

  @override
  State<CheckoutPaymentMethodScreen> createState() =>
      _CheckoutPaymentMethodScreenState();
}

class _CheckoutPaymentMethodScreenState
    extends State<CheckoutPaymentMethodScreen> {
  String? selectedPaymentMethod;

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
              SweetsColors.kTopBar,
              Color(0xFFFFFFFF),
            ],
            stops: [0.0, 0.3],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: GestureDetector(
                  onTap: () => Navigator.pushReplacementNamed(context, '/checkoutOrderSummary'),
                  child: const Row(
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
              ),
              const SizedBox(height: 24),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: SweetsCheckoutStepper(currentStep: 0),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Choose payment method',
                        style: TextStyle(
                          fontFamily: 'Geist',
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                          height: 24 / 24,
                          letterSpacing: -0.72,
                          color: SweetsColors.black,
                        ),
                      ),
                      const SizedBox(height: 20),
                      LayoutBuilder(
                        builder: (context, constraints) {
                          final cardWidth = (constraints.maxWidth - 12) / 2;
                          return Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: cardWidth,
                                    child: PaymentMethodCard(
                                      imageUrl: 'images/payment/click_uz.jpg',
                                      isSelected:
                                          selectedPaymentMethod == 'click',
                                      onTap: () {
                                        setState(() {
                                          selectedPaymentMethod = 'click';
                                        });
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  SizedBox(
                                    width: cardWidth,
                                    child: PaymentMethodCard(
                                      imageUrl: 'images/payment/payment_cards.jpg',
                                      isSelected:
                                          selectedPaymentMethod == 'card',
                                      onTap: () {
                                        setState(() {
                                          selectedPaymentMethod = 'card';
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  SizedBox(
                                    width: cardWidth,
                                    child: PaymentMethodCard(
                                      imageUrl: 'images/payment/pr_uz.jpg',
                                      isSelected:
                                          selectedPaymentMethod == 'pr',
                                      onTap: () {
                                        setState(() {
                                          selectedPaymentMethod = 'pr';
                                        });
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  SizedBox(
                                    width: cardWidth,
                                    child: PaymentMethodCard(
                                      imageUrl: 'images/payment/uzum.jpg',
                                      isSelected:
                                          selectedPaymentMethod == 'uzum',
                                      onTap: () {
                                        setState(() {
                                          selectedPaymentMethod = 'uzum';
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: SweetsColors.white,
                  border: Border(
                    top: BorderSide(
                      color: SweetsColors.border.withOpacity(0.75),
                    ),
                  ),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SweetsPrimaryButton(
                      label: 'Next',
                      onPressed: selectedPaymentMethod != null
                          ? () {
                              Navigator.pushNamed(context, '/checkoutPaymentInfo');
                            }
                          : null,
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
