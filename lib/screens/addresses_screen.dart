import 'package:flutter/material.dart';
import '../models/address_model.dart';
import '../theme/sweets_theme.dart';
import '../widgets/sweets_home_indicator.dart';
import '../widgets/sweets_button.dart';
import '../widgets/account/address_card.dart';

class AddressesScreen extends StatefulWidget {
  const AddressesScreen({super.key});

  @override
  State<AddressesScreen> createState() => _AddressesScreenState();
}

class _AddressesScreenState extends State<AddressesScreen> {
  late List<Address> addresses;

  @override
  void initState() {
    super.initState();
    // Initialize with sample addresses
    addresses = [
      Address(
        id: '1',
        label: 'Home',
        street: '3600 Maple Street',
        city: 'Santa Ana',
        state: 'California',
        zipCode: '92705',
        isSelected: false,
      ),
      Address(
        id: '2',
        label: 'Work',
        street: '3600 Maple Street',
        city: 'Santa Ana',
        state: 'California',
        zipCode: '92705',
        isSelected: false,
      ),
      Address(
        id: '3',
        label: 'Other',
        street: '3600 Maple Street',
        city: 'Santa Ana',
        state: 'California',
        zipCode: '92705',
        isSelected: false,
      ),
    ];
  }

  void _selectAddress(int index) {
    setState(() {
      // Use copyWith to maintain immutability
      for (int i = 0; i < addresses.length; i++) {
        addresses[i] = addresses[i].copyWith(isSelected: i == index);
      }
    });
  }

  void _deleteAddress(int index) {
    setState(() {
      addresses.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SweetsColors.white,
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Navigation bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 20,
                      color: SweetsColors.grayDarker,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Addresses',
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
            const SizedBox(height: 20),
            // Title
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Addresses',
                style: TextStyle(
                  fontFamily: 'Geist',
                  fontWeight: FontWeight.w600,
                  fontSize: 32,
                  height: 32 / 32,
                  letterSpacing: -0.96,
                  color: SweetsColors.black,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Address list
            Expanded(
              child: addresses.isEmpty
                  ? _buildEmptyState()
                  : ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: addresses.length,
                      separatorBuilder: (context, index) => const SizedBox(height: 8),
                      itemBuilder: (context, index) {
                        return AddressCard(
                          address: addresses[index],
                          onSelect: () => _selectAddress(index),
                          onEdit: () {
                            // TODO: Navigate to edit address
                          },
                          onDelete: () => _deleteAddress(index),
                        );
                      },
                    ),
            ),
            // Bottom button
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
                    label: 'Add new address',
                    onPressed: () {
                      Navigator.of(context).pushNamed('/checkoutDeliveryAddressWithModal');
                    },
                  ),
                  const SweetsHomeIndicator(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.location_off_outlined,
            size: 64,
            color: SweetsColors.gray.withOpacity(0.5),
          ),
          const SizedBox(height: 16),
          const Text(
            'No addresses yet',
            style: TextStyle(
              fontFamily: 'Geist',
              fontWeight: FontWeight.w500,
              fontSize: 18,
              height: 24 / 18,
              color: SweetsColors.grayDark,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Add your first address to get started',
            style: TextStyle(
              fontFamily: 'Geist',
              fontWeight: FontWeight.w400,
              fontSize: 14,
              height: 20 / 14,
              color: SweetsColors.gray,
            ),
          ),
        ],
      ),
    );
  }
}
