import 'dart:ui';
import 'package:flutter/material.dart';
import '../theme/sweets_theme.dart';
import '../constants/colors.dart';
import '../widgets/sweets_home_indicator.dart';
import '../widgets/sweets_button.dart';
import '../widgets/support/tracking_timeline.dart';
import '../widgets/support/delivery_driver_card.dart';
import '../models/tracking_step_model.dart';
import '../constants/spacing.dart';

class TrackOrderScreen extends StatefulWidget {
  const TrackOrderScreen({super.key, this.showDeliveredModal = false});

  final bool showDeliveredModal;

  @override
  State<TrackOrderScreen> createState() => _TrackOrderScreenState();
}

class _TrackOrderScreenState extends State<TrackOrderScreen> {
  bool _showDeliveredModal = false;
  late List<TrackingStep> _trackingSteps;

  @override
  void initState() {
    super.initState();
    _showDeliveredModal = widget.showDeliveredModal;
    _loadTrackingData();
  }

  void _loadTrackingData() {
    _trackingSteps = [
      TrackingStep(
        id: '1',
        title: 'Order Placed',
        date: '12 / 12 /2024',
        time: '17:00 PM',
        isCompleted: true,
        iconUrl: 'images/figma/4f7905ec-ad39-41e8-a419-31bc9bc62a86.png',
      ),
      TrackingStep(
        id: '2',
        title: 'Order packaged',
        date: '12 / 12 /2024',
        time: '17:00 PM',
        isCompleted: true,
        iconUrl: 'images/figma/b68fa81b-0c5a-4675-b3f7-85b851f17b91.png',
      ),
      TrackingStep(
        id: '3',
        title: 'Order prepared shipping',
        date: '12 / 12 /2024',
        time: '17:00 PM',
        isCompleted: false,
        isActive: true,
        iconUrl: 'images/figma/fb4c373d-9fc7-4f86-bc45-f6a9b03583e7.png',
      ),
      TrackingStep(
        id: '4',
        title: 'Order delivered',
        date: '12 / 12 /2024',
        time: '17:00 PM',
        isCompleted: false,
        iconUrl: 'images/figma/5c25e1e8-4c49-4b5b-81b6-9bd653157fc8.png',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FD),
      body: Stack(
        children: [
          Column(
            children: [
              // Map section
              Expanded(
                flex: 5,
                child: _buildMapSection(),
              ),
              // Order details section
              Expanded(
                flex: 5,
                child: _buildOrderDetailsSection(),
              ),
            ],
          ),
          // Delivered modal overlay
          if (_showDeliveredModal)
            _DeliveredModal(onClose: () {
              setState(() {
                _showDeliveredModal = false;
              });
            }),
        ],
      ),
    );
  }

  Widget _buildMapSection() {
    return Stack(
      children: [
        // Map background
        Positioned.fill(
          child: Image.asset(
            'images/figma/8e6604d4-3745-4dca-a9d3-6455b5e525e8.png',
            fit: BoxFit.cover,
            alignment: const Alignment(0.0, -0.2),
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: SweetsColors.grayLighter,
                child: const Icon(
                  Icons.map,
                  size: 80,
                  color: SweetsColors.gray,
                ),
              );
            },
          ),
        ),
        // Navigation bar with SafeArea
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          child: SafeArea(
            bottom: false,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: Spacing.lg,
                vertical: 10,
              ),
              color: SweetsColors.white,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 20,
                      color: SweetsColors.grayDarker,
                    ),
                  ),
                  const SizedBox(width: Spacing.sm),
                  const Text(
                    'Track order',
                    style: TextStyle(
                      fontFamily: 'Geist',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      height: 20 / 14,
                      color: SweetsColors.grayDarker,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOrderDetailsSection() {
    return Container(
      decoration: BoxDecoration(
        color: SweetsColors.white,
        border: Border(
          top: BorderSide(
            color: SweetsColors.border.withOpacity(0.75),
          ),
        ),
      ),
      child: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(Spacing.xl),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Order update',
                    style: TextStyle(
                      fontFamily: 'Geist',
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      height: 24 / 24,
                      letterSpacing: -0.72,
                      color: SweetsColors.black,
                    ),
                  ),
                  const Text(
                    'Estimated time: 20 - 30 min',
                    style: TextStyle(
                      fontFamily: 'Geist',
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      height: 16 / 12,
                      color: SweetsColors.grayDark,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: Spacing.xxxl),
              TrackingTimeline(steps: _trackingSteps),
              const SizedBox(height: Spacing.sectionSpacing),
              const Divider(color: SweetsColors.border),
              const SizedBox(height: Spacing.sectionSpacing),
              DeliveryDriverCard(
                driverImageUrl:
                    'images/figma/8366f8d0-dace-480e-a65f-5c6909c87cec.png',
                onContactTap: () {
                  // Handle contact driver
                },
              ),
              const SweetsHomeIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}

class _DeliveredModal extends StatelessWidget {
  const _DeliveredModal({required this.onClose});

  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Backdrop
        Positioned.fill(
          child: GestureDetector(
            onTap: onClose,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
              child: Container(
                color: Colors.black.withOpacity(0.25),
              ),
            ),
          ),
        ),
        // Modal content
        Center(
          child: Container(
            width: 396,
            margin: const EdgeInsets.symmetric(horizontal: Spacing.lg),
            padding: const EdgeInsets.all(Spacing.sectionSpacing),
            decoration: BoxDecoration(
              color: SweetsColors.white,
              borderRadius: BorderRadius.circular(Spacing.radiusXl),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Close button
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: onClose,
                    child: const Icon(
                      Icons.close,
                      size: 24,
                      color: SweetsColors.grayDarker,
                    ),
                  ),
                ),
                // Success image
                SizedBox(
                  width: 200,
                  height: 200,
                  child: Image.asset(
                    'images/figma/7e38a3ad-56e8-4e62-8693-8a946ec199c1.png',
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          color: SweetsColors.grayLighter,
                          borderRadius: BorderRadius.circular(Spacing.radiusMd),
                        ),
                        child: const Icon(
                          Icons.check_circle,
                          size: 100,
                          color: SweetsColors.primary,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: Spacing.xl),
                // Title
                const Text(
                  'order has been\nsuccessfully delivered.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Geist',
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    height: 24 / 24,
                    letterSpacing: -0.72,
                    color: SweetsColors.black,
                  ),
                ),
                const SizedBox(height: Spacing.md),
                // Message
                const Text(
                  'The order has been successfully received. Please add a rating for the product.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Geist',
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    height: 24 / 16,
                    color: SweetsColors.grayDark,
                  ),
                ),
                const SizedBox(height: Spacing.xl),
                // Add rating button
                SweetsPrimaryButton(
                  label: 'Add your rating',
                  onPressed: () {
                    onClose();
                    Navigator.of(context).pushNamed('/ratingProducts');
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
