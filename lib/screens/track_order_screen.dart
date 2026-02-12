import 'dart:ui';
import 'package:flutter/material.dart';
import '../theme/sweets_theme.dart';
import '../widgets/sweets_home_indicator.dart';
import '../widgets/sweets_button.dart';

class TrackOrderScreen extends StatefulWidget {
  const TrackOrderScreen({super.key, this.showDeliveredModal = false});

  final bool showDeliveredModal;

  @override
  State<TrackOrderScreen> createState() => _TrackOrderScreenState();
}

class _TrackOrderScreenState extends State<TrackOrderScreen> {
  bool showDeliveredModal = false;

  @override
  void initState() {
    super.initState();
    showDeliveredModal = widget.showDeliveredModal;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FD),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Map should fill approximately 52% of screen height (top area)
          final mapHeight = constraints.maxHeight * 0.52;
          
          return Stack(
            children: [
              // Map area container with overlays
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                height: mapHeight,
                child: ClipRect(
                  child: Stack(
                    children: [
                      // Map background - fills the container
                      Positioned.fill(
                        child: Image.asset('images/figma/8e6604d4-3745-4dca-a9d3-6455b5e525e8.png',
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
                      // Delivery pin - positioned at 75% of map width minus 12px, 106px from top
                      Align(
                        alignment: Alignment(
                          // 75% of width = 0.5 (center) + 0.25 = 0.75, but we need to account for the -12px offset
                          // In Figma: left-[calc(75%-12px)] on 428px screen = 321px - 12px = 309px
                          // As fraction: (309 / 428) * 2 - 1 = 0.444 (approximately)
                          // More accurately: (screenWidth * 0.75 - 12) / screenWidth * 2 - 1
                          0.444,
                          // top: 106px on mapHeight, so -1 + (106 / mapHeight) * 2
                          -1 + (106 / mapHeight) * 2,
                        ),
                        child: SizedBox(
                          width: 20,
                          height: 20,
                          child: Image.asset('images/figma/6746334d-ca85-4b25-b3a3-c39d734be1de.png',
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                decoration: BoxDecoration(
                                  color: SweetsColors.primary,
                                  shape: BoxShape.circle,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      // Delivery vehicle icon - positioned at 61.25px from left, 345.25px from top
                      Align(
                        alignment: Alignment(
                          // 61.25px on 428px screen = (61.25 / 428) * 2 - 1 = -0.714
                          -0.714,
                          // 345.25px from top of map
                          -1 + (345.25 / mapHeight) * 2,
                        ),
                        child: Transform.rotate(
                          angle: -37.78 * 3.14159 / 180,
                          child: Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              color: SweetsColors.primary,
                              shape: BoxShape.circle,
                            ),
                            child: SizedBox(
                              width: 24,
                              height: 24,
                              child: Image.asset('images/figma/0d948e15-4ea4-4660-8880-bd84a1f85848.png',
                                fit: BoxFit.contain,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(
                                    Icons.directions,
                                    color: SweetsColors.white,
                                    size: 24,
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Delivery route line - positioned at 25% of map width plus 8px, 142.5px from top
                      Align(
                        alignment: Alignment(
                          // 25% + 8px on 428px = 107px + 8px = 115px
                          // (115 / 428) * 2 - 1 = -0.463
                          -0.463,
                          // 142.5px from top
                          -1 + (142.5 / mapHeight) * 2,
                        ),
                        child: SizedBox(
                          width: 169,
                          height: 216.5,
                          child: Image.asset('images/figma/03401f8e-41d1-4ac8-a26d-0f28a7dd998d.png',
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) {
                              return CustomPaint(
                                size: const Size(169, 216.5),
                                painter: _RoutePainter(),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
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
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
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
                        const SizedBox(width: 8),
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
              // Bottom order update panel
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: SweetsColors.white,
                    border: Border(
                      top: BorderSide(
                        color: SweetsColors.border.withOpacity(0.75),
                      ),
                    ),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
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
                      const SizedBox(height: 32),
                      _OrderTimeline(),
                      const SizedBox(height: 24),
                      const Divider(color: SweetsColors.border),
                      const SizedBox(height: 24),
                      _ButlerContact(),
                      const SweetsHomeIndicator(),
                    ],
                  ),
                ),
              ),
              // Delivered modal overlay
              if (showDeliveredModal) _DeliveredModal(onClose: () {
                setState(() {
                  showDeliveredModal = false;
                });
              }),
            ],
          );
        },
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
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: SweetsColors.white,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Stack(
              children: [
                // Close button
                Positioned(
                  top: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: onClose,
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: Image.asset('images/figma/9f48c8c0-119b-4f32-9f38-064a3d83ecf0.png',
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(
                            Icons.close,
                            size: 24,
                            color: SweetsColors.grayDarker,
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Success image
                    SizedBox(
                      width: 200,
                      height: 200,
                      child: Image.asset('images/figma/7e38a3ad-56e8-4e62-8693-8a946ec199c1.png',
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                              color: SweetsColors.grayLighter,
                              borderRadius: BorderRadius.circular(12),
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
                    const SizedBox(height: 20),
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
                    const SizedBox(height: 12),
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
                    const SizedBox(height: 20),
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
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _OrderTimeline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Vertical connecting lines from Figma
        Positioned(
          left: 10,
          top: 28,
          child: SizedBox(
            width: 1,
            height: 42,
            child: Image.asset('images/figma/2039c9f7-fb5b-42d0-a023-9c522a8d9923.png',
              fit: BoxFit.fill,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 1,
                  height: 42,
                  color: SweetsColors.primary,
                );
              },
            ),
          ),
        ),
        Positioned(
          left: 10,
          top: 102,
          child: SizedBox(
            width: 1,
            height: 42,
            child: Image.asset('images/figma/2039c9f7-fb5b-42d0-a023-9c522a8d9923.png',
              fit: BoxFit.fill,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 1,
                  height: 42,
                  color: SweetsColors.primary,
                );
              },
            ),
          ),
        ),
        Positioned(
          left: 10,
          top: 176,
          child: SizedBox(
            width: 1,
            height: 42,
            child: Image.asset('images/figma/3a81e59c-ef55-41af-bd43-485990b9afdb.png',
              fit: BoxFit.fill,
              errorBuilder: (context, error, stackTrace) {
                return CustomPaint(
                  size: const Size(1, 42),
                  painter: _DashedLinePainter(),
                );
              },
            ),
          ),
        ),
        Column(
          children: [
            _TimelineItem(
              iconUrl: 'images/figma/4f7905ec-ad39-41e8-a419-31bc9bc62a86.png',
              title: 'Order Placed',
              date: '12 / 12 /2024',
              time: '17:00 PM',
              isCompleted: true,
            ),
            const SizedBox(height: 36),
            _TimelineItem(
              iconUrl: 'images/figma/b68fa81b-0c5a-4675-b3f7-85b851f17b91.png',
              title: 'Order packaged',
              date: '12 / 12 /2024',
              time: '17:00 PM',
              isCompleted: true,
            ),
            const SizedBox(height: 36),
            _TimelineItem(
              iconUrl: 'images/figma/fb4c373d-9fc7-4f86-bc45-f6a9b03583e7.png',
              title: 'Order prepared shipping',
              date: '12 / 12 /2024',
              time: '17:00 PM',
              isCompleted: false,
              isActive: true,
            ),
            const SizedBox(height: 36),
            _TimelineItem(
              iconUrl: 'images/figma/5c25e1e8-4c49-4b5b-81b6-9bd653157fc8.png',
              title: 'Order delivered',
              date: '12 / 12 /2024',
              time: '17:00 PM',
              isCompleted: false,
            ),
          ],
        ),
      ],
    );
  }
}

class _TimelineItem extends StatelessWidget {
  const _TimelineItem({
    required this.iconUrl,
    required this.title,
    required this.date,
    required this.time,
    required this.isCompleted,
    this.isActive = false,
  });

  final String iconUrl;
  final String title;
  final String date;
  final String time;
  final bool isCompleted;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Image.asset(
            iconUrl,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: isCompleted
                      ? SweetsColors.primary
                      : SweetsColors.grayLighter,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.circle,
                  size: 16,
                  color: isCompleted ? SweetsColors.white : SweetsColors.gray,
                ),
              );
            },
          ),
        ),
        const SizedBox(width: 4),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontFamily: 'Geist',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  height: 16 / 16,
                  letterSpacing: -0.32,
                  color: isActive || !isCompleted
                      ? SweetsColors.gray
                      : SweetsColors.black,
                ),
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  Text(
                    date,
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
                    time,
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
        if (isCompleted)
          SizedBox(
            width: 24,
            height: 24,
            child: Image.asset('images/figma/325489a7-73ef-426c-b0ce-d23037bf5992.png',
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.check_circle,
                  size: 24,
                  color: SweetsColors.primary,
                );
              },
            ),
          )
        else
          const SizedBox(width: 24),
      ],
    );
  }
}

class _ButlerContact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 44,
          height: 44,
          child: ClipOval(
            child: Image.asset('images/figma/8366f8d0-dace-480e-a65f-5c6909c87cec.png',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: SweetsColors.grayLighter,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.person,
                    color: SweetsColors.grayDarker,
                    size: 24,
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Contact your butler',
                style: TextStyle(
                  fontFamily: 'Geist',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  height: 24 / 16,
                  color: SweetsColors.black,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'How we can help you ?',
                style: TextStyle(
                  fontFamily: 'Geist',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  height: 20 / 14,
                  color: SweetsColors.gray,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: SweetsColors.white,
            border: Border.all(
              color: SweetsColors.border.withOpacity(0.75),
            ),
            shape: BoxShape.circle,
          ),
          child: SizedBox(
            width: 20,
            height: 20,
            child: Image.asset('images/figma/a09b2302-61f1-4327-b220-e028617efd98.png',
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.message,
                  color: SweetsColors.grayDarker,
                  size: 20,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class _RoutePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = SweetsColors.primary
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(size.width / 2, size.height / 2, size.width, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = SweetsColors.border
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    const dashWidth = 4.0;
    const dashSpace = 2.0;
    double startY = 0;

    while (startY < size.height) {
      canvas.drawLine(
        Offset(0, startY),
        Offset(0, startY + dashWidth),
        paint,
      );
      startY += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
