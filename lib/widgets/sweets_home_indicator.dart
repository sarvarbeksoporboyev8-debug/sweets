import 'package:flutter/material.dart';
import '../theme/sweets_theme.dart';
import '../constants/colors.dart';

class SweetsHomeIndicator extends StatelessWidget {
  const SweetsHomeIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: SizedBox(
        height: 34,
        child: Center(
          child: Container(
            height: 5,
            width: 134,
            decoration: BoxDecoration(
              color: SweetsColors.black,
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
      ),
    );
  }
}

