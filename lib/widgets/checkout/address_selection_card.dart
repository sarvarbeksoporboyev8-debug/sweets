import 'package:flutter/material.dart';
import '../../theme/sweets_theme.dart';
import '../../constants/colors.dart';

/// Reusable widget for displaying and selecting address cards
class AddressSelectionCard extends StatelessWidget {
  const AddressSelectionCard({
    super.key,
    required this.address,
    required this.city,
    required this.isDefault,
    required this.isSelected,
    required this.onTap,
  });

  final String address;
  final String city;
  final bool isDefault;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isDefault
              ? SweetsColors.cardPeach // Pastel peach for default
              : SweetsColors.grayLighter.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: isDefault
                    ? SweetsColors.buttonCoral // Coral for default/selected
                    : SweetsColors.grayLighter,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.location_on,
                color: SweetsColors.white,
                size: 24,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    address,
                    style: TextStyle(
                      fontFamily: 'Geist',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      height: 20 / 14,
                      color: isDefault ? SweetsColors.white : SweetsColors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    city,
                    style: TextStyle(
                      fontFamily: 'Geist',
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      height: 16 / 12,
                      color: isDefault
                          ? SweetsColors.white
                          : SweetsColors.grayDark,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Icon(
                  isDefault ? Icons.check_circle : Icons.radio_button_unchecked,
                  size: 16,
                  color: isDefault ? SweetsColors.white : SweetsColors.primary,
                ),
                const SizedBox(width: 4),
                Text(
                  isDefault ? 'Default' : 'Choose',
                  style: TextStyle(
                    fontFamily: 'Geist',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    height: 20 / 14,
                    color: isDefault ? SweetsColors.white : SweetsColors.primary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
