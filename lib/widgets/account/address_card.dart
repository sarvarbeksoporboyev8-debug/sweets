import 'package:flutter/material.dart';
import '../../models/address_model.dart';
import '../../theme/sweets_theme.dart';
import '../../constants/colors.dart';

/// Reusable address card component
class AddressCard extends StatelessWidget {
  const AddressCard({
    super.key,
    required this.address,
    this.onSelect,
    this.onEdit,
    this.onDelete,
    this.showActions = true,
  });

  final Address address;
  final VoidCallback? onSelect;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final bool showActions;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelect,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: SweetsColors.grayLighter.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: const BoxDecoration(
                color: SweetsColors.kCardBeige2,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.location_on,
                color: SweetsColors.primary,
                size: 24,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (address.label.isNotEmpty) ...[
                    Text(
                      address.label,
                      style: const TextStyle(
                        fontFamily: 'Geist',
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        height: 20 / 14,
                        color: SweetsColors.black,
                      ),
                    ),
                    const SizedBox(height: 2),
                  ],
                  Text(
                    address.street,
                    style: const TextStyle(
                      fontFamily: 'Geist',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      height: 20 / 14,
                      color: SweetsColors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    address.fullAddress,
                    style: const TextStyle(
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
            if (showActions) ...[
              const SizedBox(width: 8),
              Row(
                children: [
                  if (onEdit != null)
                    GestureDetector(
                      onTap: onEdit,
                      child: const Icon(
                        Icons.edit_outlined,
                        size: 20,
                        color: SweetsColors.grayDarker,
                      ),
                    ),
                  if (onEdit != null && onDelete != null)
                    const SizedBox(width: 8),
                  if (onDelete != null)
                    GestureDetector(
                      onTap: onDelete,
                      child: const Icon(
                        Icons.delete_outline,
                        size: 20,
                        color: SweetsColors.grayDarker,
                      ),
                    ),
                ],
              ),
            ],
            if (address.isSelected)
              const Padding(
                padding: EdgeInsets.only(left: 8),
                child: Icon(
                  Icons.check_circle,
                  size: 24,
                  color: SweetsColors.primary,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
