import 'package:flutter/material.dart';
import '../../theme/sweets_theme.dart';
import '../../theme/spacing.dart';

/// A reusable profile avatar widget with an edit button.
/// Can display either a placeholder or an actual image.
class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    super.key,
    this.imagePath,
    this.size = 104.0,
    this.onEditPressed,
  });

  final String? imagePath;
  final double size;
  final VoidCallback? onEditPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          if (imagePath != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(size / 2),
              child: Image.asset(
                imagePath!,
                width: size,
                height: size,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return _buildPlaceholder();
                },
              ),
            )
          else
            _buildPlaceholder(),
          
          // Edit button
          Positioned(
            bottom: -4,
            right: -4,
            child: GestureDetector(
              onTap: onEditPressed,
              child: Container(
                width: 32,
                height: 32,
                decoration: const BoxDecoration(
                  color: SweetsColors.primary,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.photo,
                  size: 18,
                  color: SweetsColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        color: SweetsColors.grayLighter,
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.person,
        size: 40,
        color: SweetsColors.gray,
      ),
    );
  }
}
