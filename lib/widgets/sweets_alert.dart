import 'package:flutter/material.dart';
import '../theme/sweets_theme.dart';
import '../constants/colors.dart';

class SweetsErrorAlert extends StatelessWidget {
  const SweetsErrorAlert({
    super.key,
    required this.message,
    this.onClose,
  });

  final String message;
  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: SweetsColors.dangerBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.error_outline,
            color: SweetsColors.dangerDarker,
            size: 20,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                fontFamily: 'Geist',
                fontWeight: FontWeight.w400,
                fontSize: 14,
                height: 20 / 14,
                color: SweetsColors.dangerDarker,
              ),
            ),
          ),
          if (onClose != null)
            GestureDetector(
              onTap: onClose,
              child: const Icon(
                Icons.close,
                color: SweetsColors.dangerDarker,
                size: 20,
              ),
            ),
        ],
      ),
    );
  }
}

class SweetsSuccessAlert extends StatelessWidget {
  const SweetsSuccessAlert({
    super.key,
    required this.message,
    this.onClose,
  });

  final String message;
  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: SweetsColors.successBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.check_circle_outline,
            color: SweetsColors.successDarker,
            size: 20,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                fontFamily: 'Geist',
                fontWeight: FontWeight.w400,
                fontSize: 14,
                height: 20 / 14,
                color: SweetsColors.successDarker,
              ),
            ),
          ),
          if (onClose != null)
            GestureDetector(
              onTap: onClose,
              child: const Icon(
                Icons.close,
                color: SweetsColors.successDarker,
                size: 20,
              ),
            ),
        ],
      ),
    );
  }
}
