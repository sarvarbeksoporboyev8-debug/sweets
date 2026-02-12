import 'package:flutter/material.dart';
import '../../theme/sweets_theme.dart';
import '../../constants/spacing.dart';

/// Profile header widget displaying user avatar, name and email
class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    required this.name,
    required this.email,
    this.avatarUrl,
    this.onEditAvatar,
  });

  final String name;
  final String email;
  final String? avatarUrl;
  final VoidCallback? onEditAvatar;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: Spacing.lg),
        // Profile avatar
        Stack(
          children: [
            Container(
              width: 104,
              height: 104,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: SweetsColors.white,
                  width: 2,
                ),
              ),
              child: ClipOval(
                child: avatarUrl != null
                    ? Image.asset(
                        avatarUrl!,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return _buildDefaultAvatar();
                        },
                      )
                    : _buildDefaultAvatar(),
              ),
            ),
            Positioned(
              bottom: -10,
              right: -10,
              child: GestureDetector(
                onTap: onEditAvatar,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: SweetsColors.primary,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: SweetsColors.white,
                      width: 2,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x1A343A40),
                        offset: Offset(0, 12),
                        blurRadius: 20,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.camera_alt,
                    color: SweetsColors.white,
                    size: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: Spacing.spacing20),
        // Name and email
        Text(
          name,
          style: const TextStyle(
            fontFamily: 'Geist',
            fontWeight: FontWeight.w600,
            fontSize: 32,
            height: 32 / 32,
            letterSpacing: -0.96,
            color: SweetsColors.black,
          ),
        ),
        SizedBox(height: Spacing.xs),
        Text(
          email,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: SweetsColors.gray,
              ),
        ),
        SizedBox(height: Spacing.spacing20),
      ],
    );
  }

  Widget _buildDefaultAvatar() {
    return Container(
      color: SweetsColors.grayLighter,
      child: const Icon(
        Icons.person,
        size: 52,
        color: SweetsColors.gray,
      ),
    );
  }
}
