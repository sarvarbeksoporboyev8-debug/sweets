import 'package:flutter/material.dart';
import '../theme/sweets_theme.dart';
import '../constants/spacing.dart';
import '../widgets/sweets_navigation_bar.dart';
import '../widgets/sweets_button.dart';
import '../widgets/sweets_otp_field.dart';
import '../widgets/sweets_alert.dart';
import '../widgets/sweets_home_indicator.dart';

/// Unified OTP verification screen with state management.
/// Replaces OtpVerificationScreen01-03 with conditional rendering based on state.
class OtpVerificationScreen extends StatefulWidget {
  /// Phone number to display (masked)
  final String phoneNumber;
  
  /// Optional error message to show
  final String? errorMessage;

  const OtpVerificationScreen({
    super.key,
    this.phoneNumber = '+96 6901 ****** 01',
    this.errorMessage,
  });

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final List<String> _otpValues = ['', '', '', ''];
  String? _currentError;
  bool _isLoading = false;
  bool _canResend = true;
  int _resendCountdown = 0;

  @override
  void initState() {
    super.initState();
    _currentError = widget.errorMessage;
  }

  void _onOtpChanged(int index, String value) {
    setState(() {
      _otpValues[index] = value;
      // Clear error when user starts typing
      if (_currentError != null) {
        _currentError = null;
      }
    });
  }

  bool get _isOtpComplete => _otpValues.every((value) => value.isNotEmpty);

  void _handleVerify() {
    setState(() {
      _isLoading = true;
    });

    final otp = _otpValues.join();
    
    // Simulate API call
    // TODO: Replace with actual API verification
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
          // Example: Show error for invalid OTP (demo only)
          if (otp == '0000') {
            _currentError = 'Invalid OTP code. Please try again.';
          } else {
            // Navigate to next screen
            // Navigator.pushReplacementNamed(context, '/complete-profile');
          }
        });
      }
    });
  }

  void _handleResend() {
    if (!_canResend) return;

    setState(() {
      _canResend = false;
      _resendCountdown = 60;
      _currentError = null;
    });

    // Simulate sending OTP
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        // Show success message
        setState(() {
          _currentError = null;
        });
      }
    });

    // Start countdown
    _startCountdown();
  }

  void _startCountdown() {
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted && _resendCountdown > 0) {
        setState(() {
          _resendCountdown--;
          if (_resendCountdown == 0) {
            _canResend = true;
          }
        });
        _startCountdown();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SweetsColors.white,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const SweetsNavigationBar(title: 'OTP'),
            
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
                      
                      // Image (300x300) - intentionally fixed size for illustration
                      SizedBox(
                        width: 300,
                        height: 300,
                        child: Image.asset(
                          'images/figma/56b2db5a-fd58-4a7a-bd89-c9e2d2d586e6.png',
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(
                              Icons.verified_user,
                              size: 300,
                              color: SweetsColors.primary,
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: SweetsSpacing.paddingLarge),
                      
                      // Text with phone number
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 396),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: Theme.of(context).textTheme.bodyMedium,
                            children: [
                              const TextSpan(text: 'The verification code has been sent to the number\n'),
                              TextSpan(
                                text: widget.phoneNumber,
                                style: const TextStyle(
                                  fontFamily: 'Geist',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  height: 24 / 16,
                                  color: SweetsColors.grayDarker,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: SweetsSpacing.paddingLarge),
                      
                      // OTP Inputs
                      SweetsOtpField(
                        values: _otpValues,
                        onChanged: _onOtpChanged,
                      ),
                      const SizedBox(height: SweetsSpacing.padding),
                      
                      // Resend link with countdown
                      GestureDetector(
                        onTap: _canResend ? _handleResend : null,
                        child: Text(
                          _canResend 
                              ? 'Resend' 
                              : 'Resend in ${_resendCountdown}s',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w500,
                                color: _canResend 
                                    ? SweetsColors.primary 
                                    : SweetsColors.gray,
                              ),
                          textAlign: TextAlign.center,
                        ),
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
              child: SweetsPrimaryButton(
                label: _isLoading ? 'Verifying...' : 'Verify',
                onPressed: _isOtpComplete && !_isLoading ? _handleVerify : null,
              ),
            ),
            const SweetsHomeIndicator(),
          ],
        ),
      ),
    );
  }
}
