import 'dart:ui';
import 'package:flutter/material.dart';
import '../theme/sweets_theme.dart';
import '../constants/colors.dart';
import '../widgets/sweets_home_indicator.dart';
import '../widgets/sweets_button.dart';
import '../widgets/sweets_checkout_stepper.dart';
import '../widgets/sweets_fields.dart';
import '../widgets/checkout/address_selection_card.dart';

class CheckoutDeliveryAddressScreen extends StatefulWidget {
  const CheckoutDeliveryAddressScreen({
    super.key,
    this.showAddAddressModal = false,
  });

  final bool showAddAddressModal;

  @override
  State<CheckoutDeliveryAddressScreen> createState() =>
      _CheckoutDeliveryAddressScreenState();
}

class _CheckoutDeliveryAddressScreenState
    extends State<CheckoutDeliveryAddressScreen> {
  String? selectedAddress;
  late bool showAddAddressModal;

  @override
  void initState() {
    super.initState();
    showAddAddressModal = widget.showAddAddressModal;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SweetsColors.white,
      body: Stack(
        children: [
          Container(
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
                      onTap: () => Navigator.pop(context),
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
                    child: SweetsCheckoutStepper(currentStep: 1),
                  ),
                  const SizedBox(height: 24),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Choose delivery address',
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
                          AddressSelectionCard(
                            address: '3600 Maple Street',
                            city: 'Santa Ana, California, Zip code: 92705',
                            isDefault: true,
                            isSelected: selectedAddress == 'address1',
                            onTap: () {
                              setState(() {
                                selectedAddress = 'address1';
                              });
                            },
                          ),
                          const SizedBox(height: 8),
                          AddressSelectionCard(
                            address: '3600 Maple Street',
                            city: 'Santa Ana, California, Zip code: 92705',
                            isDefault: false,
                            isSelected: selectedAddress == 'address2',
                            onTap: () {
                              setState(() {
                                selectedAddress = 'address2';
                              });
                            },
                          ),
                          const SizedBox(height: 8),
                          AddressSelectionCard(
                            address: '3600 Maple Street',
                            city: 'Santa Ana, California, Zip code: 92705',
                            isDefault: false,
                            isSelected: selectedAddress == 'address3',
                            onTap: () {
                              setState(() {
                                selectedAddress = 'address3';
                              });
                            },
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            child: OutlinedButton(
                              onPressed: () {
                                setState(() {
                                  showAddAddressModal = true;
                                });
                              },
                              style: OutlinedButton.styleFrom(
                                foregroundColor: SweetsColors.primary,
                                side: const BorderSide(color: SweetsColors.primary),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 14,
                                ),
                              ),
                              child: const Text(
                                'Add new address',
                                style: TextStyle(
                                  fontFamily: 'Geist',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  height: 24 / 16,
                                  color: SweetsColors.primary,
                                ),
                              ),
                            ),
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
                          label: 'Next',
                          onPressed: selectedAddress != null
                              ? () {
                                  Navigator.pushNamed(context, '/checkoutOrderSummary');
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
          if (showAddAddressModal)
            Positioned.fill(
              child: _AddAddressModal(
                onClose: () {
                  setState(() {
                    showAddAddressModal = false;
                  });
                },
              ),
            ),
        ],
      ),
    );
  }
}

class _AddAddressModal extends StatelessWidget {
  const _AddAddressModal({required this.onClose});

  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Overlay
        Positioned.fill(
          child: Container(
            color: Colors.black.withOpacity(0.25),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ),
        ),
        // Modal content
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            decoration: const BoxDecoration(
              color: SweetsColors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0x1A343A40),
                  offset: Offset(0, -12),
                  blurRadius: 20,
                ),
              ],
            ),
            padding: const EdgeInsets.only(
              top: 20,
              left: 16,
              right: 16,
              bottom: 16,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(
                      child: Text(
                        'Add new delivery address',
                        style: TextStyle(
                          fontFamily: 'Geist',
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                          height: 24 / 24,
                          letterSpacing: -0.72,
                          color: SweetsColors.black,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    GestureDetector(
                      onTap: onClose,
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: SweetsColors.grayLighter,
                        ),
                        child: const Icon(
                          Icons.close,
                          size: 16,
                          color: SweetsColors.grayDarker,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SweetsTextField(
                  label: 'Full address',
                  hint: 'Full address',
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: SweetsTextField(
                        label: 'City',
                        hint: 'City',
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: SweetsTextField(
                        label: 'State',
                        hint: 'State',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SweetsTextField(
                  label: 'Zip code',
                  hint: 'Zip code',
                ),
                const SizedBox(height: 24),
                SweetsPrimaryButton(
                  label: 'Add',
                  onPressed: () {
                    onClose();
                    // TODO: Add address
                  },
                ),
                const SizedBox(height: 16),
                const SweetsHomeIndicator(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
