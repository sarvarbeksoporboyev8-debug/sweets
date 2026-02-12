import 'package:flutter/material.dart';
import '../theme/sweets_theme.dart';
import '../constants/colors.dart';

class SweetsTextField extends StatelessWidget {
  const SweetsTextField({
    super.key,
    required this.label,
    required this.hint,
    this.controller,
    this.keyboardType,
    this.validator,
    this.onChanged,
  });

  final String label;
  final String hint;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;

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
        const SizedBox(height: 4),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          validator: validator,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hint,
          ),
        ),
      ],
    );
  }
}

class SweetsMultilineField extends StatelessWidget {
  const SweetsMultilineField({
    super.key,
    required this.label,
    required this.hint,
    this.controller,
    this.minLines = 4,
    this.maxLines = 6,
  });

  final String label;
  final String hint;
  final TextEditingController? controller;
  final int minLines;
  final int maxLines;

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
        const SizedBox(height: 4),
        TextFormField(
          controller: controller,
          minLines: minLines,
          maxLines: maxLines,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
            hintText: hint,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 14,
            ),
          ),
        ),
      ],
    );
  }
}

class SweetsPhoneNumberField extends StatelessWidget {
  const SweetsPhoneNumberField({
    super.key,
    required this.label,
    required this.hint,
    this.controller,
    this.value,
  });

  final String label;
  final String hint;
  final TextEditingController? controller;
  final String? value;

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
        const SizedBox(height: 4),
        TextFormField(
          controller: controller,
          keyboardType: TextInputType.phone,
          initialValue: value,
          style: TextStyle(
            fontFamily: 'Geist',
            fontWeight: FontWeight.w400,
            fontSize: 14,
            height: 20 / 14,
            color: value != null ? SweetsColors.grayDarker : SweetsColors.gray,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: theme.textTheme.bodySmall,
          ),
        ),
      ],
    );
  }
}

