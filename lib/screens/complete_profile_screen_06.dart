import 'package:flutter/material.dart';
import '../theme/sweets_theme.dart';
import '../widgets/sweets_navigation_bar.dart';
import '../widgets/sweets_button.dart';
import '../widgets/sweets_alert.dart';
import '../widgets/sweets_home_indicator.dart';

class CompleteProfileScreen06 extends StatelessWidget {
  const CompleteProfileScreen06({super.key});

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
            const SweetsNavigationBar(title: 'Complete profile'),
            // Success alert - naturally flows after navbar
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: SweetsSuccessAlert(
                message: 'Data has been updated successfully.',
              ),
            ),
            // Main content - scrollable
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
                    _AvatarWithImage(),
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
                    const _LabeledField(
                      label: 'Full Name',
                      hint: 'John',
                      value: 'John',
                    ),
                    const SizedBox(height: 16),
                    const _LabeledField(
                      label: 'Last Name',
                      hint: 'Doe',
                      value: 'Doe',
                    ),
                    const SizedBox(height: 16),
                    const _DateOfBirthField(
                      label: 'Date of Birth',
                      hint: '1990 / 02 / 24',
                      value: '1990 / 02 / 24',
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
                  SweetsPrimaryButton(
                    label: 'Add',
                    onPressed: () {
                      // TODO: navigate after profile completion
                    },
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

class _AvatarWithImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 104,
      height: 104,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(52),
            child: Image.asset('images/figma/55c05d27-fe88-4899-84b4-efa3b2c25b2b.png',
              width: 104,
              height: 104,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 104,
                  height: 104,
                  decoration: const BoxDecoration(
                    color: SweetsColors.grayLighter,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.person,
                    size: 40,
                    color: SweetsColors.gray,
                  ),
                );
              },
            ),
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

