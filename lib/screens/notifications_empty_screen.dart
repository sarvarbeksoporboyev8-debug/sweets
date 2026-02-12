import 'package:flutter/material.dart';
import '../theme/sweets_theme.dart';
import '../widgets/sweets_home_indicator.dart';

// From Figma get_design_context (will periodically expire and can be replaced)
const _notificationsImageUrl =
    'images/figma/150a0efc-b6bc-4ecd-96b1-f07dcb48a03e.png';

class NotificationsEmptyScreen extends StatelessWidget {
  const NotificationsEmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SweetsColors.white,
      body: Stack(
        children: [
          // Gradient background
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Container(
              height: 168,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFFFE6D1),
                    Color(0xFFFFFFFF),
                  ],
                ),
              ),
            ),
          ),
          // Main content
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: SafeArea(
              child: Column(
                children: [
                  // Navigation bar
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
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
                          'Notifications',
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
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 270,
                            height: 270,
                            child: Image.asset(
                              _notificationsImageUrl,
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  width: 270,
                                  height: 270,
                                  decoration: BoxDecoration(
                                    color: SweetsColors.grayLighter,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Icon(
                                    Icons.notifications_none,
                                    size: 100,
                                    color: SweetsColors.gray,
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'No notifications',
                            style: TextStyle(
                              fontFamily: 'Geist',
                              fontWeight: FontWeight.w600,
                              fontSize: 32,
                              height: 32 / 32,
                              letterSpacing: -0.96,
                              color: SweetsColors.black,
                            ),
                          ),
                          const SizedBox(height: 8),
                          SizedBox(
                            width: 286,
                            child: Text(
                              'Unfortunately, there are no alerts at the moment.',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: SweetsColors.grayDark,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Home indicator
          const Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: SweetsHomeIndicator(),
          ),
        ],
      ),
    );
  }
}

