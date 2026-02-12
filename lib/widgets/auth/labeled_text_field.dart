import 'package:flutter/material.dart';
import '../../theme/sweets_theme.dart';
import '../../theme/spacing.dart';

/// A reusable labeled text field for forms.
/// Displays a label above the text field.
class LabeledTextField extends StatelessWidget {
  const LabeledTextField({
    super.key,
    required this.label,
    required this.hint,
    this.controller,
    this.keyboardType,
    this.suffixIcon,
    this.readOnly = false,
    this.onTap,
  });

  final String label;
  final String hint;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final bool readOnly;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.textTheme.labelSmall?.copyWith(
            color: SweetsColors.grayDarker,
          ),
        ),
        SizedBox(height: Spacing.xs),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            suffixIcon: suffixIcon,
          ),
          keyboardType: keyboardType,
          readOnly: readOnly,
          onTap: onTap,
          style: theme.textTheme.bodySmall?.copyWith(
            color: SweetsColors.grayDarker,
          ),
        ),
      ],
    );
  }
}
