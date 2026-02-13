import 'package:flutter/material.dart';
import '../theme/sweets_theme.dart';
import '../constants/colors.dart';
import '../widgets/sweets_home_indicator.dart';
import '../widgets/sweets_button.dart';
import '../widgets/sweets_fields.dart';
import '../models/contact_message_model.dart';
import '../constants/spacing.dart';
import '../constants/gradients.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _subjectController = TextEditingController();
  bool _isSubmitting = false;

  @override
  void dispose() {
    _nameController.dispose();
    _subjectController.dispose();
    super.dispose();
  }

  Future<void> _submitContactMessage() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() => _isSubmitting = true);

    final message = ContactMessage(
      name: _nameController.text,
      subject: _subjectController.text,
    );

    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));

    setState(() => _isSubmitting = false);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Message sent successfully')),
      );
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SweetsColors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Navigation bar
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Spacing.lg,
                        vertical: 10,
                      ),
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
                          const SizedBox(width: Spacing.sm),
                          const Text(
                            'Contact us',
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
                    const SizedBox(height: Spacing.headerSpacing),
                    // Content
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(
                          horizontal: Spacing.md,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Center(
                              child: Text(
                                'Contact us',
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
                            const SizedBox(height: Spacing.headerSpacing),
                            SweetsTextField(
                              label: 'Full Name',
                              hint: 'Full Name',
                              controller: _nameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your name';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: Spacing.lg),
                            _SubjectField(
                              label: 'Subject',
                              hint: 'Subject',
                              controller: _subjectController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a subject';
                                }
                                return null;
                              },
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
          ),
          // Bottom button
          Container(
            decoration: BoxDecoration(
              color: SweetsColors.white,
              border: Border(
                top: BorderSide(
                  color: SweetsColors.border.withOpacity(0.75),
                ),
              ),
            ),
            padding: const EdgeInsets.all(Spacing.lg),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SweetsPrimaryButton(
                  label: _isSubmitting ? 'Sending...' : 'Send',
                  onPressed: _isSubmitting ? null : _submitContactMessage,
                ),
                const SweetsHomeIndicator(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SubjectField extends StatelessWidget {
  const _SubjectField({
    required this.label,
    required this.hint,
    this.controller,
    this.validator,
  });

  final String label;
  final String hint;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

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
        const SizedBox(height: Spacing.xs),
        Container(
          height: 160,
          padding: const EdgeInsets.symmetric(
            horizontal: Spacing.md,
            vertical: 14,
          ),
          decoration: BoxDecoration(
            color: SweetsColors.white,
            border: Border.all(color: SweetsColors.border),
            borderRadius: BorderRadius.circular(Spacing.radiusMd),
          ),
          child: TextFormField(
            controller: controller,
            validator: validator,
            maxLines: null,
            expands: true,
            textAlignVertical: TextAlignVertical.top,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(
                fontFamily: 'Geist',
                fontWeight: FontWeight.w400,
                fontSize: 14,
                height: 20 / 14,
                color: SweetsColors.gray,
              ),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
