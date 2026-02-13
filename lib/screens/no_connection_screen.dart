import 'package:flutter/material.dart';
import '../theme/sweets_theme.dart';
import '../constants/colors.dart';
import '../constants/spacing.dart';
import '../widgets/sweets_home_indicator.dart';
import '../widgets/common/empty_state_container.dart';

class NoConnectionScreen extends StatefulWidget {
  const NoConnectionScreen({super.key});

  @override
  State<NoConnectionScreen> createState() => _NoConnectionScreenState();
}

class _NoConnectionScreenState extends State<NoConnectionScreen> {
  bool _isRetrying = false;

  void _retryConnection() async {
    setState(() {
      _isRetrying = true;
    });

    // Simulate network retry
    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      setState(() {
        _isRetrying = false;
      });

      // TODO: Implement actual connection retry logic
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Connection retry completed'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SweetsColors.white,
      body: EmptyStateContainer(
        imagePath: 'images/figma/c951e197-ca5f-442c-a93a-f29dcbed1088.png',
        fallbackIcon: Icons.wifi_off,
        title: 'There is a problem.',
        message: 'Unfortunately, the internet connection could not be established. Please check, thank you.',
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.all(Spacing.lg),
            child: SizedBox(
              height: Spacing.buttonHeight,
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _isRetrying ? null : _retryConnection,
                icon: _isRetrying
                    ? SizedBox(
                        width: Spacing.iconMd,
                        height: Spacing.iconMd,
                        child: const CircularProgressIndicator(
                          color: SweetsColors.white,
                          strokeWidth: 2,
                        ),
                      )
                    : const Icon(
                        Icons.refresh,
                        size: Spacing.iconMd,
                        color: SweetsColors.white,
                      ),
                label: Text(
                  _isRetrying ? 'Retrying...' : 'Try again',
                  style: const TextStyle(
                    fontFamily: 'Geist',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    height: 24 / 16,
                    color: SweetsColors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: SweetsColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Spacing.borderRadiusLg),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 14,
                  ),
                ),
              ),
            ),
          ),
          const SweetsHomeIndicator(),
        ],
      ),
    );
  }
}
