import 'package:flutter/material.dart';
import '../../theme/sweets_theme.dart';
import '../../constants/colors.dart';

/// Reusable widget for displaying success message
class SuccessMessage extends StatelessWidget {
  const SuccessMessage({
    super.key,
    required this.title,
    required this.message,
    this.imageAsset,
  });

  final String title;
  final String message;
  final String? imageAsset;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 270,
          height: 270,
          child: imageAsset != null
              ? Image.asset(
                  imageAsset!,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 270,
                      height: 270,
                      decoration: BoxDecoration(
                        color: SweetsColors.grayLighter,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: const Icon(
                        Icons.check_circle,
                        size: 80,
                        color: SweetsColors.primary,
                      ),
                    );
                  },
                )
              : Container(
                  width: 270,
                  height: 270,
                  decoration: BoxDecoration(
                    color: SweetsColors.grayLighter,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: const Icon(
                    Icons.check_circle,
                    size: 80,
                    color: SweetsColors.primary,
                  ),
                ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(
            fontFamily: 'Geist',
            fontWeight: FontWeight.w600,
            fontSize: 32,
            height: 1.0,
            letterSpacing: -0.96,
            color: SweetsColors.black,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: 286,
          child: Text(
            message,
            style: const TextStyle(
              fontFamily: 'Geist',
              fontWeight: FontWeight.w400,
              fontSize: 16,
              height: 24 / 16,
              color: SweetsColors.grayDark,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
