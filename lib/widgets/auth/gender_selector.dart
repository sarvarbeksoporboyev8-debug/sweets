import 'package:flutter/material.dart';
import '../../theme/sweets_theme.dart';
import '../../constants/colors.dart';
import '../../theme/spacing.dart';

/// A reusable gender selector widget for forms.
/// Allows selection between Male and Female options.
class GenderSelector extends StatelessWidget {
  const GenderSelector({
    super.key,
    required this.selectedGender,
    required this.onGenderChanged,
  });

  final String? selectedGender;
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
        SizedBox(height: Spacing.sm),
        Row(
          children: [
            _GenderOption(
              label: 'Male',
              selected: selectedGender == 'Male',
              onTap: () => onGenderChanged('Male'),
            ),
            SizedBox(width: Spacing.lg),
            _GenderOption(
              label: 'Female',
              selected: selectedGender == 'Female',
              onTap: () => onGenderChanged('Female'),
            ),
          ],
        ),
      ],
    );
  }
}

class _GenderOption extends StatelessWidget {
  const _GenderOption({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(Spacing.xs),
            child: Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                color: selected ? SweetsColors.primary : SweetsColors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: selected ? SweetsColors.primary : SweetsColors.border,
                  width: 1,
                ),
              ),
              child: selected
                  ? Container(
                      margin: EdgeInsets.all(Spacing.xs),
                      decoration: const BoxDecoration(
                        color: SweetsColors.white,
                        shape: BoxShape.circle,
                      ),
                    )
                  : null,
            ),
          ),
          SizedBox(width: Spacing.xs),
          Text(
            label,
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
    );
  }
}
