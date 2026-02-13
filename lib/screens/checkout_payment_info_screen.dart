import 'package:flutter/material.dart';
import '../theme/sweets_theme.dart';
import '../constants/colors.dart';
import '../widgets/sweets_home_indicator.dart';
import '../widgets/sweets_button.dart';
import '../widgets/sweets_checkout_stepper.dart';
import '../widgets/sweets_fields.dart';

class CheckoutPaymentInfoScreen extends StatefulWidget {
  const CheckoutPaymentInfoScreen({super.key});

  @override
  State<CheckoutPaymentInfoScreen> createState() =>
      _CheckoutPaymentInfoScreenState();
}

class _CheckoutPaymentInfoScreenState extends State<CheckoutPaymentInfoScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _cardNumberController;
  late TextEditingController _expiryController;
  late TextEditingController _cvvController;
  late TextEditingController _nameController;
  bool _isProcessing = false;

  @override
  void initState() {
    super.initState();
    _cardNumberController = TextEditingController();
    _expiryController = TextEditingController();
    _cvvController = TextEditingController();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _cardNumberController.dispose();
    _expiryController.dispose();
    _cvvController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  bool get _isFormValid {
    return _cardNumberController.text.isNotEmpty &&
        _expiryController.text.isNotEmpty &&
        _cvvController.text.isNotEmpty &&
        _nameController.text.isNotEmpty;
  }

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
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: GestureDetector(
                    onTap: () => Navigator.pushReplacementNamed(context, '/checkoutPaymentMethod'),
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
                          controller: _cardNumberController,
                          onChanged: (_) => setState(() {}),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: SweetsTextField(
                                label: 'Expiration Date',
                                hint: '12/26',
                                controller: _expiryController,
                                onChanged: (_) => setState(() {}),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: SweetsTextField(
                                label: 'CVC',
                                hint: '123',
                                controller: _cvvController,
                                onChanged: (_) => setState(() {}),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        SweetsTextField(
                          label: 'Cardholder Name',
                          hint: 'Achref Maher',
                          controller: _nameController,
                          onChanged: (_) => setState(() {}),
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
                        color: SweetsColors.border.withOpacity(0.75),
                      ),
                    ),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SweetsPrimaryButton(
                        label: _isProcessing ? 'Processing...' : 'Next',
                        onPressed: _isFormValid && !_isProcessing
                            ? () async {
                                setState(() {
                                  _isProcessing = true;
                                });
                                // Simulate processing
                                await Future.delayed(
                                    const Duration(milliseconds: 500));
                                if (mounted) {
                                  setState(() {
                                    _isProcessing = false;
                                  });
                                  Navigator.pushNamed(context, '/checkoutSuccess');
                                }
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
      ),
    );
  }
}
