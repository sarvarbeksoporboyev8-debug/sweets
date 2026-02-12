import 'package:flutter/material.dart';
import '../theme/sweets_theme.dart';
import '../widgets/sweets_home_indicator.dart';
import '../widgets/sweets_button.dart';
import '../widgets/sweets_fields.dart';
import '../widgets/sweets_alert.dart';

class PersonalInformationScreen extends StatefulWidget {
  const PersonalInformationScreen({
    super.key,
    this.showSuccessAlert = false,
  });

  final bool showSuccessAlert;

  @override
  State<PersonalInformationScreen> createState() =>
      _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen> {
  String selectedGender = 'Male';
  bool showSuccessAlert = false;

  @override
  void initState() {
    super.initState();
    showSuccessAlert = widget.showSuccessAlert;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SweetsColors.white,
      body: Stack(
        children: [
          // Main content
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: SafeArea(
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
                          'Personal Information',
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
                  // Success alert
                  if (showSuccessAlert)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: SweetsSuccessAlert(
                        message: 'The information has been successfully updated.',
                        onClose: () {
                          setState(() {
                            showSuccessAlert = false;
                          });
                        },
                      ),
                    ),
                  const SizedBox(height: 16),
                  // Content
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 28),
                          const Center(
                            child: Text(
                              'Personal Information',
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
                          const SizedBox(height: 28),
                          // Profile avatar
                          Center(
                            child: Stack(
                              children: [
                                Container(
                                  width: 104,
                                  height: 104,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: SweetsColors.white,
                                      width: 2,
                                    ),
                                  ),
                                  child: ClipOval(
                                    child: Image.asset('images/figma/f092cc25-617f-46de-89ca-1e83f1b139f5.png',
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, error, stackTrace) {
                                        return Image.asset(
                                          'assets/images/profile_avatar.png',
                                          fit: BoxFit.cover,
                                          errorBuilder: (context, error, stackTrace) {
                                            return Container(
                                              color: SweetsColors.grayLighter,
                                              child: const Icon(
                                                Icons.person,
                                                size: 52,
                                                color: SweetsColors.gray,
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: -10,
                                  right: -10,
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: SweetsColors.primary,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: SweetsColors.white,
                                        width: 2,
                                      ),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color(0x1A343A40),
                                          offset: Offset(0, 12),
                                          blurRadius: 20,
                                        ),
                                      ],
                                    ),
                                    child: const Icon(
                                      Icons.camera_alt,
                                      color: SweetsColors.white,
                                      size: 24,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 28),
                          // Form
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Gender radio buttons
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Gender',
                                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                          color: SweetsColors.grayDarker,
                                        ),
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      _RadioButton(
                                        label: 'Male',
                                        isSelected: selectedGender == 'Male',
                                        onTap: () {
                                          setState(() {
                                            selectedGender = 'Male';
                                          });
                                        },
                                      ),
                                      const SizedBox(width: 16),
                                      _RadioButton(
                                        label: 'Female',
                                        isSelected: selectedGender == 'Female',
                                        onTap: () {
                                          setState(() {
                                            selectedGender = 'Female';
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              SweetsTextField(
                                label: 'Full Name',
                                hint: 'John',
                              ),
                              const SizedBox(height: 16),
                              SweetsTextField(
                                label: 'Last Name',
                                hint: 'Doe',
                              ),
                              const SizedBox(height: 16),
                              _DatePickerField(
                                label: 'Date of Birth',
                                placeholder: '1990 / 02 / 24',
                              ),
                            ],
                          ),
                          const SizedBox(height: 100),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Bottom button
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
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
                    label: 'Save',
                    onPressed: () {
                      setState(() {
                        showSuccessAlert = true;
                      });
                    },
                  ),
                  const SweetsHomeIndicator(),
                ],
              ),
            ),
          ),
        ],
      ),
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

class _DatePickerField extends StatelessWidget {
  const _DatePickerField({
    required this.label,
    required this.placeholder,
  });

  final String label;
  final String placeholder;

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
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          decoration: BoxDecoration(
            color: SweetsColors.white,
            border: Border.all(color: SweetsColors.border),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  placeholder,
                  style: const TextStyle(
                    fontFamily: 'Geist',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    height: 20 / 14,
                    color: SweetsColors.grayDarker,
                  ),
                ),
              ),
              const Icon(
                Icons.calendar_today,
                size: 20,
                color: SweetsColors.grayDarker,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
