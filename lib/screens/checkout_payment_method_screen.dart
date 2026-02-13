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
      backgroundColor: SweetsColors.kCreamBg,
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
                                      imageUrl:
                                          'images/figma/4c0a786c-86c9-4720-9c55-a32a3679afc1.png',
                                      isSelected:
                                          selectedPaymentMethod == 'paypal',
                                      onTap: () {
                                        setState(() {
                                          selectedPaymentMethod = 'paypal';
                                        });
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  SizedBox(
                                    width: cardWidth,
                                    child: PaymentMethodCard(
                                      imageUrl:
                                          'images/figma/1fc72a13-dacf-43fc-a776-65f72d78a544.png',
                                      isVisaMastercard: true,
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
                                      imageUrl:
                                          'images/figma/e4dd3010-ed8d-4bed-8ab3-c104f0f8c909.png',
                                      isSelected:
                                          selectedPaymentMethod == 'apple',
                                      onTap: () {
                                        setState(() {
                                          selectedPaymentMethod = 'apple';
                                        });
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  SizedBox(
                                    width: cardWidth,
                                    child: PaymentMethodCard(
                                      imageUrl:
                                          'images/figma/544e596b-6e32-481e-b9a4-0ff3186fcab5.png',
                                      isSelected:
                                          selectedPaymentMethod == 'google',
                                      onTap: () {
                                        setState(() {
                                          selectedPaymentMethod = 'google';
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
                              // TODO: Navigate to next step
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
