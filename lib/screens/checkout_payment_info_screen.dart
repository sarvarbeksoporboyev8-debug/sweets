import 'package:flutter/material.dart';
import '../theme/sweets_theme.dart';
import '../widgets/sweets_home_indicator.dart';
import '../widgets/sweets_button.dart';
import '../widgets/sweets_checkout_stepper.dart';
import '../widgets/sweets_fields.dart';

class CheckoutPaymentInfoScreen extends StatelessWidget {
  const CheckoutPaymentInfoScreen({super.key});

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
                            'Payment Information',
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
                          SweetsTextField(
                            label: 'Card Number',
                            hint: '1234 1234 1234 1234',
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: SweetsTextField(
                                  label: 'Expiration Date',
                                  hint: '12/26',
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: SweetsTextField(
                                  label: 'CVC',
                                  hint: '123',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          SweetsTextField(
                            label: 'Cardholder Name',
                            hint: 'Achref Maher',
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
          // Bottom button
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
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
                    onPressed: () {
                      // TODO: Navigate to delivery address
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
