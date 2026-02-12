import 'package:flutter/material.dart';
import '../theme/sweets_theme.dart';
import '../constants/spacing.dart';
import '../widgets/sweets_navigation_bar.dart';
import '../widgets/sweets_button.dart';
import '../widgets/sweets_fields.dart';
import '../widgets/sweets_alert.dart';
import '../widgets/sweets_home_indicator.dart';

/// Unified login screen with state management for different UI variants.
/// Replaces LoginScreen01-04 with conditional rendering based on state.
class LoginScreen extends StatefulWidget {
  /// Optional initial phone number
  final String? initialPhoneNumber;
  
  /// Optional alert to show (error or success)
  final LoginAlert? alert;

  const LoginScreen({
    super.key,
    this.initialPhoneNumber,
    this.alert,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _phoneController;
  LoginAlert? _currentAlert;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController(text: widget.initialPhoneNumber);
    _currentAlert = widget.alert;
    _phoneController.addListener(_onPhoneChanged);
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  void _onPhoneChanged() {
    setState(() {
      // Clear alert when user starts typing
      if (_currentAlert != null) {
        _currentAlert = null;
      }
    });
  }

  bool get _isButtonEnabled => _phoneController.text.trim().isNotEmpty && !_isLoading;

  void _handleLogin() {
    setState(() {
      _isLoading = true;
    });

    // Simulate API call
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
          // Example: Show success or error based on validation
          if (_phoneController.text.contains('invalid')) {
            _currentAlert = LoginAlert.error(
              'The phone number does not exist. Please create\na new account.',
            );
          } else {
            _currentAlert = LoginAlert.success('Welcome back.');
          }
        });
      }
    });
  }

  void _handleCreateAccount() {
    // Navigate to signup screen
    // Navigator.pushNamed(context, '/signup');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SweetsColors.white,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const SweetsNavigationBar(title: 'Login'),
            
            // Conditional alert display
            if (_currentAlert != null)
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  SweetsSpacing.padding,
                  SweetsSpacing.padding,
                  SweetsSpacing.padding,
                  0,
                ),
                child: _currentAlert!.isError
                    ? SweetsErrorAlert(message: _currentAlert!.message)
                    : SweetsSuccessAlert(message: _currentAlert!.message),
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
                          'images/figma/72126bc3-3071-44fb-9046-b9422611b976.png',
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(
                              Icons.person,
                              size: 152,
                              color: SweetsColors.primary,
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: SweetsSpacing.gap),
                      
                      // Title
                      Text(
                        'Welcome back! 👋',
                        style: Theme.of(context).textTheme.headlineLarge,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: SweetsSpacing.gap),
                      
                      // Subtitle
                      Text(
                        'Log in to your account.',
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
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
                    label: _isLoading ? 'Logging in...' : 'Login',
                    onPressed: _isButtonEnabled ? _handleLogin : null,
                  ),
                  const SizedBox(height: SweetsSpacing.gap),
                  
                  // Create account link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(width: SweetsSpacing.gapSmall),
                      GestureDetector(
                        onTap: _handleCreateAccount,
                        child: Text(
                          'Create a new account',
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

/// Alert model for login screen states
class LoginAlert {
  final String message;
  final bool isError;

  const LoginAlert({
    required this.message,
    required this.isError,
  });

  factory LoginAlert.error(String message) {
    return LoginAlert(message: message, isError: true);
  }

  factory LoginAlert.success(String message) {
    return LoginAlert(message: message, isError: false);
  }
}
