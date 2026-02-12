import 'package:flutter/material.dart';
import '../../theme/sweets_theme.dart';
import '../../theme/spacing.dart';

/// A reusable success message widget for authentication screens.
/// Displays an image, title, and description in a consistent layout.
class SuccessMessage extends StatelessWidget {
  const SuccessMessage({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    this.imageSize = 180.0,
    this.descriptionMaxWidth,
  });

  final String imagePath;
  final String title;
  final String description;
  final double imageSize;
  final double? descriptionMaxWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Image
        SizedBox(
          width: imageSize,
          height: imageSize,
          child: Image.asset(
            imagePath,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return Icon(
                Icons.check_circle,
                size: imageSize,
                color: SweetsColors.primary,
              );
            },
          ),
        ),
        SizedBox(height: Spacing.md),
        
        // Title
        Text(
          title,
          style: Theme.of(context).textTheme.headlineLarge,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: Spacing.md),
        
        // Description
        if (descriptionMaxWidth != null)
          SizedBox(
            width: descriptionMaxWidth,
            child: Text(
              description,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          )
        else
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Spacing.lg),
            child: Text(
              description,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ),
      ],
    );
  }
}
