import 'package:flutter/material.dart';
import '../../theme/sweets_theme.dart';
import '../../constants/spacing.dart';

class CircleIconButton extends StatelessWidget {
  const CircleIconButton({super.key, required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Spacing.spacing40,
      height: Spacing.spacing40,
      decoration: BoxDecoration(
        color: SweetsColors.white,
        borderRadius: BorderRadius.circular(Spacing.spacing20),
      ),
      child: Icon(
        icon,
        size: Spacing.spacing20,
        color: SweetsColors.grayDarker,
      ),
    );
  }
}
