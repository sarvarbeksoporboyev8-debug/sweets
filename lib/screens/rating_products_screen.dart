import 'package:flutter/material.dart';
import '../theme/sweets_theme.dart';
import '../constants/colors.dart';
import '../widgets/sweets_home_indicator.dart';
import '../widgets/sweets_button.dart';
import '../widgets/sweets_fields.dart';
import '../widgets/account/star_rating_widget.dart';

class RatingProductsScreen extends StatefulWidget {
  const RatingProductsScreen({super.key});

  @override
  State<RatingProductsScreen> createState() => _RatingProductsScreenState();
}

class _RatingProductsScreenState extends State<RatingProductsScreen> {
  int selectedRating = 0;
  late TextEditingController _nameController;
  late TextEditingController _reviewController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _reviewController = TextEditingController();
    // Add listeners to rebuild when text changes
    _nameController.addListener(() => setState(() {}));
    _reviewController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _nameController.dispose();
    _reviewController.dispose();
    super.dispose();
  }

  bool get _isFormValid {
    if (!mounted) return false;
    return selectedRating > 0 && 
           _nameController.text.trim().isNotEmpty &&
           _reviewController.text.trim().isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SweetsColors.white,
      body: Stack(
        children: [
          // Gradient background
          Container(
            height: 168,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  SweetsColors.kTopBar,
                  Color(0xFFFFFFFF),
                ],
              ),
            ),
          ),
          // Main content
          SafeArea(
            bottom: false,
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
                        'Rating products',
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
                const SizedBox(height: 28),
                // Content
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(
                          child: Text(
                            'Add your rating',
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
                        // Rating section
                        Row(
                          children: [
                            const Text(
                              'Add your rating:',
                              style: TextStyle(
                                fontFamily: 'Geist',
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                height: 20 / 14,
                                color: SweetsColors.grayDarker,
                              ),
                            ),
                            const SizedBox(width: 8),
                            StarRatingWidget(
                              rating: selectedRating,
                              onRatingChanged: (rating) {
                                setState(() {
                                  selectedRating = rating;
                                });
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        SweetsTextField(
                          label: 'Full Name',
                          hint: 'Full Name',
                          controller: _nameController,
                        ),
                        const SizedBox(height: 16),
                        SweetsMultilineField(
                          label: 'Add your reviews',
                          hint: 'Add your reviews',
                          controller: _reviewController,
                          minLines: 6,
                          maxLines: 8,
                        ),
                        const SizedBox(height: 100),
                      ],
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
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SweetsPrimaryButton(
                        label: 'Add',
                        onPressed: _isFormValid
                            ? () {
                                // TODO: Submit rating
                                Navigator.of(context).pop();
                              }
                            : null,
                      ),
                      const SweetsHomeIndicator(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
