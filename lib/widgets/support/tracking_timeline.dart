import 'package:flutter/material.dart';
import '../../theme/sweets_theme.dart';
import '../../models/tracking_step_model.dart';
import '../../constants/spacing.dart';
import 'tracking_step_indicator.dart';

/// Timeline widget showing order tracking steps
class TrackingTimeline extends StatelessWidget {
  const TrackingTimeline({
    super.key,
    required this.steps,
  });

  final List<TrackingStep> steps;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(steps.length, (index) {
        final step = steps[index];
        final isLast = index == steps.length - 1;

        return Column(
          children: [
            TrackingStepIndicator(
              step: step,
              showConnector: !isLast,
            ),
            if (!isLast) const SizedBox(height: 36),
          ],
        );
      }),
    );
  }
}
