import 'package:flutter/material.dart';
import '../theme/sweets_theme.dart';
import '../theme/spacing.dart';
import '../widgets/sweets_navigation_bar.dart';
import '../widgets/sweets_button.dart';
import '../widgets/sweets_alert.dart';
import '../widgets/sweets_home_indicator.dart';
import '../widgets/auth/profile_avatar.dart';
import '../widgets/auth/gender_selector.dart';
import '../widgets/auth/labeled_text_field.dart';

/// Complete profile screen with pre-filled data and success alert.
/// Shows profile completion with existing user information.
class CompleteProfileScreen06 extends StatefulWidget {
  const CompleteProfileScreen06({super.key});

  @override
  State<CompleteProfileScreen06> createState() => _CompleteProfileScreen06State();
}

class _CompleteProfileScreen06State extends State<CompleteProfileScreen06> {
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _dateOfBirthController;
  String? _selectedGender;

  @override
  void initState() {
    super.initState();
    // Initialize with pre-filled data
    _firstNameController = TextEditingController(text: 'John');
    _lastNameController = TextEditingController(text: 'Doe');
    _dateOfBirthController = TextEditingController(text: '1990 / 02 / 24');
    _selectedGender = 'Male';
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _dateOfBirthController.dispose();
    super.dispose();
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: SweetsColors.white,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const SweetsNavigationBar(title: 'Complete profile'),
            
            Padding(
              padding: EdgeInsets.fromLTRB(Spacing.lg, Spacing.lg, Spacing.lg, 0),
              child: const SweetsSuccessAlert(
                message: 'Data has been updated successfully.',
              ),
            ),
            
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: Spacing.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: Spacing.xxxxl),
                    
                    ProfileAvatar(
                      imagePath: 'images/figma/55c05d27-fe88-4899-84b4-efa3b2c25b2b.png',
                      onEditPressed: _handleEditPhoto,
                    ),
                    
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
                      hint: 'John',
                      controller: _firstNameController,
                    ),
                    
                    SizedBox(height: Spacing.lg),
                    
                    LabeledTextField(
                      label: 'Last Name',
                      hint: 'Doe',
                      controller: _lastNameController,
                    ),
                    
                    SizedBox(height: Spacing.lg),
                    
                    LabeledTextField(
                      label: 'Date of Birth',
                      hint: '1990 / 02 / 24',
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
              child: SweetsPrimaryButton(
                label: 'Add',
                onPressed: _handleAddPressed,
              ),
            ),
            const SweetsHomeIndicator(),
          ],
        ),
      ),
    );
  }
}
