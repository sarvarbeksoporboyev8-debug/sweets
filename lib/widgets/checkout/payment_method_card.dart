import 'package:flutter/material.dart';
import '../../theme/sweets_theme.dart';

/// Reusable widget for payment method selection card
class PaymentMethodCard extends StatelessWidget {
  const PaymentMethodCard({
    super.key,
    required this.imageUrl,
    this.isVisaMastercard = false,
    required this.isSelected,
    required this.onTap,
  });

  final String imageUrl;
  final bool isVisaMastercard;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 100,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: SweetsColors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected
                ? SweetsColors.primary
                : SweetsColors.border.withOpacity(0.75),
            width: 1,
          ),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Center(
              child: isVisaMastercard
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 60,
                          height: 29,
                          child: Image.asset(
                            'images/figma/1fc72a13-dacf-43fc-a776-65f72d78a544.png',
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(
                                Icons.credit_card,
                                size: 24,
                                color: SweetsColors.gray,
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 4),
                        SizedBox(
                          width: 60,
                          height: 29,
                          child: Image.asset(
                            'images/figma/c28778f1-6902-4f12-982d-e21ae2b46427.png',
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(
                                Icons.credit_card,
                                size: 24,
                                color: SweetsColors.gray,
                              );
                            },
                          ),
                        ),
                      ],
                    )
                  : Image.asset(
                      imageUrl,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.payment,
                          size: 40,
                          color: SweetsColors.gray,
                        );
                      },
                    ),
            ),
            if (isSelected)
              Positioned(
                right: -9,
                top: -9,
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: SweetsColors.primary,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: SweetsColors.white,
                      width: 2,
                    ),
                  ),
                  child: const Icon(
                    Icons.check,
                    size: 16,
                    color: SweetsColors.white,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
