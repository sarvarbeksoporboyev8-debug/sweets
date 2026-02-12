import 'package:flutter/material.dart';
import '../../theme/sweets_theme.dart';
import '../../constants/colors.dart';

/// Reusable gender selector component with radio buttons
class GenderSelector extends StatelessWidget {
  const GenderSelector({
    super.key,
    required this.selectedGender,
    required this.onGenderChanged,
  });

  final String selectedGender;
  final ValueChanged<String> onGenderChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Gender',
          style: theme.textTheme.labelSmall?.copyWith(
            color: SweetsColors.grayDarker,
          ),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            _RadioButton(
              label: 'Male',
              isSelected: selectedGender == 'Male',
              onTap: () => onGenderChanged('Male'),
            ),
            const SizedBox(width: 16),
            _RadioButton(
              label: 'Female',
              isSelected: selectedGender == 'Female',
              onTap: () => onGenderChanged('Female'),
            ),
          ],
        ),
      ],
    );
  }
}

class _RadioButton extends StatelessWidget {
  const _RadioButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              color: isSelected ? SweetsColors.primary : SweetsColors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? SweetsColors.primary : SweetsColors.border,
              ),
            ),
            child: isSelected
                ? Center(
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: SweetsColors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                  )
                : null,
          ),
          const SizedBox(width: 4),
          Text(
            label,
            style: const TextStyle(
              fontFamily: 'Geist',
              fontWeight: FontWeight.w400,
              fontSize: 14,
              height: 20 / 14,
              color: SweetsColors.grayDarker,
            ),
          ),
        ],
      ),
    );
  }
}
