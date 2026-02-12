import 'package:flutter/material.dart';
import '../../theme/sweets_theme.dart';
import '../../models/tracking_step_model.dart';
import '../../constants/spacing.dart';

/// Single step indicator in the tracking timeline
class TrackingStepIndicator extends StatelessWidget {
  const TrackingStepIndicator({
    super.key,
    required this.step,
    this.showConnector = true,
  });

  final TrackingStep step;
  final bool showConnector;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            _buildIcon(),
            if (showConnector) _buildConnector(),
          ],
        ),
        const SizedBox(width: Spacing.xs),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                step.title,
                style: TextStyle(
                  fontFamily: 'Geist',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  height: 16 / 16,
                  letterSpacing: -0.32,
                  color: step.isActive || !step.isCompleted
                      ? SweetsColors.gray
                      : SweetsColors.black,
                ),
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  Text(
                    step.date,
                    style: const TextStyle(
                      fontFamily: 'Geist',
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      height: 16 / 12,
                      color: SweetsColors.gray,
                    ),
                  ),
                  const Text(
                    ' - ',
                    style: TextStyle(
                      fontFamily: 'Geist',
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      height: 16 / 12,
                      color: SweetsColors.gray,
                    ),
                  ),
                  Text(
                    step.time,
                    style: const TextStyle(
                      fontFamily: 'Geist',
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      height: 16 / 12,
                      color: SweetsColors.gray,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        if (step.isCompleted)
          const Icon(
            Icons.check_circle,
            size: 24,
            color: SweetsColors.primary,
          )
        else
          const SizedBox(width: 24),
      ],
    );
  }

  Widget _buildIcon() {
    if (step.iconUrl != null) {
      return SizedBox(
        width: 24,
        height: 24,
        child: Image.asset(
          step.iconUrl!,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            return _buildDefaultIcon();
          },
        ),
      );
    }
    return _buildDefaultIcon();
  }

  Widget _buildDefaultIcon() {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: step.isCompleted
            ? SweetsColors.primary
            : SweetsColors.grayLighter,
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.circle,
        size: 16,
        color: step.isCompleted ? SweetsColors.white : SweetsColors.gray,
      ),
    );
  }

  Widget _buildConnector() {
    return Container(
      width: 1,
      height: 42,
      margin: const EdgeInsets.symmetric(vertical: 4),
      color: step.isCompleted ? SweetsColors.primary : SweetsColors.border,
    );
  }
}
