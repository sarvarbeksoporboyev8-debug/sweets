import 'package:flutter/material.dart';
import '../theme/sweets_theme.dart';
import '../widgets/sweets_home_indicator.dart';
import '../widgets/sweets_button.dart';
import '../widgets/sweets_fields.dart';
import '../constants/spacing.dart';
import '../constants/gradients.dart';

class AddNotesScreen extends StatefulWidget {
  const AddNotesScreen({super.key});

  @override
  State<AddNotesScreen> createState() => _AddNotesScreenState();
}

class _AddNotesScreenState extends State<AddNotesScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _notesController = TextEditingController();
  bool _isSubmitting = false;

  @override
  void dispose() {
    _nameController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _submitNotes() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() => _isSubmitting = true);

    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));

    setState(() => _isSubmitting = false);

    if (mounted) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SweetsColors.white,
      body: Column(
        children: [
          // Gradient background header
          Container(
            height: 168,
            decoration: const BoxDecoration(
              gradient: AppGradients.headerGradient,
            ),
          ),
          Expanded(
            child: SafeArea(
              top: false,
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
                            'Add notes',
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
                                'Add notes',
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
                            _NotesField(
                              label: 'Add notes',
                              hint: 'Add notes',
                              controller: _notesController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your notes';
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
                  label: _isSubmitting ? 'Adding...' : 'Add',
                  onPressed: _isSubmitting ? null : _submitNotes,
                ),
                const SweetsHomeIndicator(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _NotesField extends StatelessWidget {
  const _NotesField({
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
