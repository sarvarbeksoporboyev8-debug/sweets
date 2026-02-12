import 'package:flutter/material.dart';
import '../theme/sweets_theme.dart';
import '../widgets/sweets_home_indicator.dart';
import '../widgets/sweets_button.dart';
import '../widgets/sweets_checkout_stepper.dart';

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
                                        child: _PaymentMethodCard(
                                          imageUrl:
                                              'images/figma/4c0a786c-86c9-4720-9c55-a32a3679afc1.png',
                                          isSelected: selectedPaymentMethod == 'paypal',
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
                                        child: _PaymentMethodCard(
                                          imageUrl:
                                              'images/figma/1fc72a13-dacf-43fc-a776-65f72d78a544.png',
                                          isVisaMastercard: true,
                                          isSelected: selectedPaymentMethod == 'card',
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
                                        child: _PaymentMethodCard(
                                          imageUrl:
                                              'images/figma/e4dd3010-ed8d-4bed-8ab3-c104f0f8c909.png',
                                          isSelected: selectedPaymentMethod == 'apple',
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
                                        child: _PaymentMethodCard(
                                          imageUrl:
                                              'images/figma/544e596b-6e32-481e-b9a4-0ff3186fcab5.png',
                                          isSelected: selectedPaymentMethod == 'google',
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
          ),
        ],
      ),
    );
  }
}

class _PaymentMethodCard extends StatelessWidget {
  const _PaymentMethodCard({
    required this.imageUrl,
    this.isVisaMastercard = false,
    required this.isSelected,
    required this.onTap,
  });

  final String imageUrl;
  final bool isVisaMastercard;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 100,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: SweetsColors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected
                ? SweetsColors.primary
                : SweetsColors.border.withOpacity(0.75),
            width: 1,
          ),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Center(
              child: isVisaMastercard
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 60,
                          height: 29,
                          child: Image.asset(
                            'images/figma/1fc72a13-dacf-43fc-a776-65f72d78a544.png',
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(
                                Icons.credit_card,
                                size: 24,
                                color: SweetsColors.gray,
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 4),
                        SizedBox(
                          width: 60,
                          height: 29,
                          child: Image.asset(
                            'images/figma/c28778f1-6902-4f12-982d-e21ae2b46427.png',
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(
                                Icons.credit_card,
                                size: 24,
                                color: SweetsColors.gray,
                              );
                            },
                          ),
                        ),
                      ],
                    )
                  : Image.asset(
                      imageUrl,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.payment,
                          size: 40,
                          color: SweetsColors.gray,
                        );
                      },
                    ),
            ),
            if (isSelected)
              Positioned(
                right: -9,
                top: -9,
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: SweetsColors.primary,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: SweetsColors.white,
                      width: 2,
                    ),
                  ),
                  child: const Icon(
                    Icons.check,
                    size: 16,
                    color: SweetsColors.white,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
