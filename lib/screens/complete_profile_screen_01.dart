import 'package:flutter/material.dart';
import '../theme/sweets_theme.dart';
import '../widgets/sweets_navigation_bar.dart';
import '../widgets/sweets_home_indicator.dart';

class CompleteProfileScreen01 extends StatelessWidget {
  const CompleteProfileScreen01({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: SweetsColors.white,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // Navigation bar
            const SweetsNavigationBar(title: 'Complete Profile'),
            // Main content - scrollable
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
                    _AvatarPlaceholder(),
                    const SizedBox(height: 24),
                    Text(
                      'Add Information',
                      style: theme.textTheme.headlineLarge,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Gender',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: SweetsColors.grayDarker,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Row(
                      children: [
                        _GenderOption(label: 'Male', selected: true),
                        SizedBox(width: 16),
                        _GenderOption(label: 'Female', selected: false),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _LabeledField(
                      label: 'Full Name',
                      hint: 'Full Name',
                    ),
                    const SizedBox(height: 16),
                    _LabeledField(
                      label: 'Last Name',
                      hint: 'Last Name',
                    ),
                    const SizedBox(height: 16),
                    const _DateOfBirthField(
                      label: 'Date of Birth',
                      hint: 'Day / Month / Year',
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
            // Bottom CTA block - fixed at bottom
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 56,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: SweetsColors.primaryLighter,
                        foregroundColor: SweetsColors.white75,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 14,
                        ),
                      ),
                      child: const Text(
                        'Add',
                        style: TextStyle(
                          fontFamily: 'Geist',
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          height: 24 / 16,
                          letterSpacing: 0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SweetsHomeIndicator(),
          ],
        ),
      ),
    );
  }
}

class _AvatarPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 104,
      height: 104,
      decoration: const BoxDecoration(
        color: SweetsColors.grayLighter,
        shape: BoxShape.circle,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Icon(
            Icons.person,
            size: 40,
            color: SweetsColors.gray,
          ),
          Positioned(
            bottom: -4,
            right: -4,
            child: Container(
              width: 32,
              height: 32,
              decoration: const BoxDecoration(
                color: SweetsColors.primary,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.photo,
                size: 18,
                color: SweetsColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _GenderOption extends StatelessWidget {
  const _GenderOption({
    required this.label,
    required this.selected,
  });

  final String label;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(4),
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
                    margin: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: SweetsColors.white,
                      shape: BoxShape.circle,
                    ),
                  )
                : null,
          ),
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
    );
  }
}

class _LabeledField extends StatelessWidget {
  const _LabeledField({
    required this.label,
    required this.hint,
    this.value,
  });

  final String label;
  final String hint;
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
          initialValue: value,
          decoration: InputDecoration(
            hintText: hint,
          ),
          style: TextStyle(
            fontFamily: 'Geist',
            fontWeight: FontWeight.w400,
            fontSize: 14,
            height: 20 / 14,
            color: value != null ? SweetsColors.grayDarker : SweetsColors.gray,
          ),
        ),
      ],
    );
  }
}

class _DateOfBirthField extends StatelessWidget {
  const _DateOfBirthField({
    required this.label,
    required this.hint,
    this.value,
  });

  final String label;
  final String hint;
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
          initialValue: value,
          decoration: InputDecoration(
            hintText: hint,
            suffixIcon: const Icon(
              Icons.calendar_today_rounded,
              size: 20,
              color: SweetsColors.primary,
            ),
          ),
          keyboardType: TextInputType.datetime,
          style: TextStyle(
            fontFamily: 'Geist',
            fontWeight: FontWeight.w400,
            fontSize: 14,
            height: 20 / 14,
            color: value != null ? SweetsColors.grayDarker : SweetsColors.gray,
          ),
        ),
      ],
    );
  }
}

