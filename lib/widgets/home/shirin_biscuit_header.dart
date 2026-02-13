import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/spacing.dart';

/// Decorative header widget displaying "Shirin Biscuit" text
/// Used in the home screen to replace the account/profile section
class ShirinBiscuitHeader extends StatelessWidget {
  const ShirinBiscuitHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Shirin Biscuit',
      style: const TextStyle(
        fontFamily: 'Dancing Script',
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: SweetsColors.kDarkText,
        letterSpacing: 0.5,
        height: 1.2,
      ),
    );
  }
}
