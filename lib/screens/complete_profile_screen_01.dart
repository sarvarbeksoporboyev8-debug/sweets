import 'package:flutter/material.dart';
import '../theme/sweets_theme.dart';
import '../constants/colors.dart';
import '../theme/spacing.dart';
import '../widgets/sweets_navigation_bar.dart';
import '../widgets/sweets_home_indicator.dart';
import '../widgets/auth/profile_avatar.dart';
import '../widgets/auth/gender_selector.dart';
import '../widgets/auth/labeled_text_field.dart';

/// Complete profile screen for adding user information.
/// Uses StatefulWidget with TextEditingController for proper state management.
class CompleteProfileScreen01 extends StatefulWidget {
  const CompleteProfileScreen01({super.key});

  @override
  State<CompleteProfileScreen01> createState() => _CompleteProfileScreen01State();
}

class _CompleteProfileScreen01State extends State<CompleteProfileScreen01> {
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _dateOfBirthController;
  String? _selectedGender;

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _dateOfBirthController = TextEditingController();
    _selectedGender = 'Male'; // Default selection
    
    // Add listeners to trigger rebuilds on text changes
    _firstNameController.addListener(_updateFormState);
    _lastNameController.addListener(_updateFormState);
    _dateOfBirthController.addListener(_updateFormState);
  }

  @override
  void dispose() {
    _firstNameController.removeListener(_updateFormState);
    _lastNameController.removeListener(_updateFormState);
    _dateOfBirthController.removeListener(_updateFormState);
    _firstNameController.dispose();
    _lastNameController.dispose();
    _dateOfBirthController.dispose();
    super.dispose();
  }

  void _updateFormState() {
    setState(() {
      // Triggers rebuild to update button state
    });
  }

  void _handleAddPressed() {
    // TODO: Validate and save profile data
  }

  void _handleEditPhoto() {
    // TODO: Open image picker
  }

  void _handleDateOfBirthTap() {
    // TODO: Open date picker
  }

  bool get _isFormValid {
    return _firstNameController.text.isNotEmpty &&
           _lastNameController.text.isNotEmpty &&
           _dateOfBirthController.text.isNotEmpty &&
           _selectedGender != null;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: SweetsColors.kCreamBg,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const SweetsNavigationBar(title: 'Complete Profile'),
            
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: Spacing.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: Spacing.xxxxl),
                    
                    ProfileAvatar(onEditPressed: _handleEditPhoto),
                    
                    SizedBox(height: Spacing.xxl),
                    
                    Text(
                      'Add Information',
                      style: theme.textTheme.headlineLarge,
                      textAlign: TextAlign.center,
                    ),
                    
                    SizedBox(height: Spacing.xxl),
                    
                    GenderSelector(
                      selectedGender: _selectedGender,
                      onGenderChanged: (gender) {
                        setState(() {
                          _selectedGender = gender;
                        });
                      },
                    ),
                    
                    SizedBox(height: Spacing.lg),
                    
                    LabeledTextField(
                      label: 'Full Name',
                      hint: 'Full Name',
                      controller: _firstNameController,
                    ),
                    
                    SizedBox(height: Spacing.lg),
                    
                    LabeledTextField(
                      label: 'Last Name',
                      hint: 'Last Name',
                      controller: _lastNameController,
                    ),
                    
                    SizedBox(height: Spacing.lg),
                    
                    LabeledTextField(
                      label: 'Date of Birth',
                      hint: 'Day / Month / Year',
                      controller: _dateOfBirthController,
                      keyboardType: TextInputType.datetime,
                      readOnly: true,
                      onTap: _handleDateOfBirthTap,
                      suffixIcon: const Icon(
                        Icons.calendar_today_rounded,
                        size: 20,
                        color: SweetsColors.primary,
                      ),
                    ),
                    
                    SizedBox(height: Spacing.xxxxl),
                  ],
                ),
              ),
            ),
            
            Padding(
              padding: EdgeInsets.all(Spacing.lg),
              child: SizedBox(
                height: Spacing.buttonHeight,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isFormValid ? _handleAddPressed : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _isFormValid
                        ? SweetsColors.primary
                        : SweetsColors.kAccentGold,
                    foregroundColor: _isFormValid
                        ? SweetsColors.white
                        : SweetsColors.white75,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Spacing.lg),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: Spacing.xl,
                      vertical: Spacing.buttonPadding,
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
            ),
            const SweetsHomeIndicator(),
          ],
        ),
      ),
    );
  }
}
