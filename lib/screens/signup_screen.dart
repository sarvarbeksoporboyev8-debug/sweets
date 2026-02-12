import 'package:flutter/material.dart';
import '../theme/sweets_theme.dart';
import '../constants/spacing.dart';
import '../widgets/sweets_navigation_bar.dart';
import '../widgets/sweets_button.dart';
import '../widgets/sweets_fields.dart';
import '../widgets/sweets_alert.dart';
import '../widgets/sweets_home_indicator.dart';

/// Unified signup screen with state management for different UI variants.
/// Replaces SignupScreen01-03 with conditional rendering based on state.
class SignupScreen extends StatefulWidget {
  /// Optional initial phone number
  final String? initialPhoneNumber;
  
  /// Optional error message to show
  final String? errorMessage;

  const SignupScreen({
    super.key,
    this.initialPhoneNumber,
    this.errorMessage,
  });

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late TextEditingController _phoneController;
  String? _currentError;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController(text: widget.initialPhoneNumber);
    _currentError = widget.errorMessage;
    _phoneController.addListener(_onPhoneChanged);
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  void _onPhoneChanged() {
    setState(() {
      // Clear error when user starts typing
      if (_currentError != null) {
        _currentError = null;
      }
    });
  }

  bool get _isButtonEnabled => _phoneController.text.trim().isNotEmpty && !_isLoading;

  void _handleSignup() {
    setState(() {
      _isLoading = true;
    });

    // Simulate API call
    // TODO: Replace with actual registration API
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
          // Example: Show error if phone exists (demo only)
          if (_phoneController.text.contains('exists')) {
            _currentError = 'The phone number already exists, try to login to your account.';
          } else {
            // Navigate to OTP verification
            // Navigator.pushNamed(context, '/otp-verification');
          }
        });
      }
    });
  }

  void _handleLogin() {
    // Navigate to login screen
    // Navigator.pushNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SweetsColors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const SweetsNavigationBar(title: 'Signup'),
            
            // Conditional error alert display
            if (_currentError != null)
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  SweetsSpacing.padding,
                  SweetsSpacing.padding,
                  SweetsSpacing.padding,
                  0,
                ),
                child: SweetsErrorAlert(message: _currentError!),
              ),
            
            // Main content - scrollable and centered
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: SweetsSpacing.padding),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: SweetsSpacing.xxxl),
                      
                      // Image (152x152) - intentionally fixed size for avatar
                      SizedBox(
                        width: 152,
                        height: 152,
                        child: Image.asset(
                          'images/figma/c653d9c9-8f5a-48e7-820a-7beec44fa2e4.png',
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(
                              Icons.person_add,
                              size: 152,
                              color: SweetsColors.primary,
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: SweetsSpacing.gap),
                      
                      // Title
                      Text(
                        'Create your account 😊',
                        style: Theme.of(context).textTheme.headlineLarge,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: SweetsSpacing.gap),
                      
                      // Subtitle - responsive width
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 346),
                        child: Text(
                          'Create a new account and get ready for a new adventure now.',
                          style: Theme.of(context).textTheme.bodyMedium,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: SweetsSpacing.gap),
                      
                      // Phone number field with controller
                      SweetsPhoneNumberField(
                        label: 'Phone number',
                        hint: 'Add phone number',
                        controller: _phoneController,
                      ),
                      const SizedBox(height: SweetsSpacing.xxxl),
                    ],
                  ),
                ),
              ),
            ),
            
            // Bottom section - fixed at the bottom
            Padding(
              padding: const EdgeInsets.all(SweetsSpacing.padding),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SweetsPrimaryButton(
                    label: _isLoading ? 'Creating account...' : 'Create account',
                    onPressed: _isButtonEnabled ? _handleSignup : null,
                  ),
                  const SizedBox(height: SweetsSpacing.gap),
                  
                  // Login link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(width: SweetsSpacing.gapSmall),
                      GestureDetector(
                        onTap: _handleLogin,
                        child: Text(
                          'Login',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w500,
                                color: SweetsColors.primary,
                              ),
                        ),
                      ),
                    ],
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
