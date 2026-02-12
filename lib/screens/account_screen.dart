import 'package:flutter/material.dart';
import '../theme/sweets_theme.dart';
import '../widgets/sweets_home_indicator.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  // Profile avatar
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          width: 104,
                          height: 104,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: SweetsColors.white,
                              width: 2,
                            ),
                          ),
                          child: ClipOval(
                            child: Image.asset('images/figma/713a293f-33da-4e36-8fc5-f95d8f3cc12f.png',
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Image.asset(
                                  'assets/images/profile_avatar.png',
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      color: SweetsColors.grayLighter,
                                      child: const Icon(
                                        Icons.person,
                                        size: 52,
                                        color: SweetsColors.gray,
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: -10,
                          right: -10,
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: SweetsColors.primary,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: SweetsColors.white,
                                width: 2,
                              ),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x1A343A40),
                                  offset: Offset(0, 12),
                                  blurRadius: 20,
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.camera_alt,
                              color: SweetsColors.white,
                              size: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Name and email
                  Center(
                    child: Column(
                      children: [
                        const Text(
                          'John Doe',
                          style: TextStyle(
                            fontFamily: 'Geist',
                            fontWeight: FontWeight.w600,
                            fontSize: 32,
                            height: 32 / 32,
                            letterSpacing: -0.96,
                            color: SweetsColors.black,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'johndoe@gmail.com',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: SweetsColors.gray,
                              ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Menu items
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          _AccountMenuItem(
                            icon: Icons.person_outline,
                            label: 'Personal Information',
                            onTap: () {
                              Navigator.of(context).pushNamed('/personalInformation');
                            },
                          ),
                          const SizedBox(height: 8),
                          _AccountMenuItem(
                            icon: Icons.shopping_bag_outlined,
                            label: 'Orders',
                            onTap: () {
                              Navigator.of(context).pushNamed('/orders');
                            },
                          ),
                          const SizedBox(height: 8),
                          _AccountMenuItem(
                            icon: Icons.favorite_outline,
                            label: 'Favorites',
                            onTap: () {
                              Navigator.of(context).pushNamed('/favorites');
                            },
                          ),
                          const SizedBox(height: 8),
                          _AccountMenuItem(
                            icon: Icons.location_on_outlined,
                            label: 'Addresses',
                            onTap: () {
                              Navigator.of(context).pushNamed('/addresses');
                            },
                          ),
                          const SizedBox(height: 8),
                          _LogoutItem(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Bottom navigation
          const Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: _AccountTabBar(),
          ),
        ],
      ),
    );
  }
}

class _AccountMenuItem extends StatelessWidget {
  const _AccountMenuItem({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: SweetsColors.grayLighter.withOpacity(0.5),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 20,
              color: SweetsColors.grayDarker,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  fontFamily: 'Geist',
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  height: 20 / 14,
                  color: SweetsColors.grayDarker,
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 20,
              color: SweetsColors.grayDarker,
            ),
          ],
        ),
      ),
    );
  }
}

class _LogoutItem extends StatelessWidget {
  const _LogoutItem();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO: Handle logout
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            const Icon(
              Icons.logout,
              size: 20,
              color: Color(0xFFFA5252),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                'Logout',
                style: const TextStyle(
                  fontFamily: 'Geist',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  height: 24 / 16,
                  color: Color(0xFFFA5252),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AccountTabBar extends StatelessWidget {
  const _AccountTabBar();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            color: SweetsColors.white,
            border: Border(
              top: BorderSide(
                color: SweetsColors.border.withOpacity(0.75),
              ),
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              _TabItem(label: 'Home', icon: Icons.home_filled, active: false),
              _TabItem(
                  label: 'Explore',
                  icon: Icons.search_rounded,
                  active: false),
              _TabItem(
                  label: 'Favorites',
                  icon: Icons.favorite_border,
                  active: false),
              _TabItem(
                  label: 'Cart',
                  icon: Icons.shopping_bag_outlined,
                  active: false),
              _TabItem(
                  label: 'Account',
                  icon: Icons.person_outline,
                  active: true),
            ],
          ),
        ),
        const SweetsHomeIndicator(),
      ],
    );
  }
}

class _TabItem extends StatelessWidget {
  const _TabItem({
    required this.label,
    required this.icon,
    required this.active,
  });

  final String label;
  final IconData icon;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: active ? SweetsColors.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            boxShadow: active
                ? const [
                    BoxShadow(
                      color: Color(0x66FD7E14),
                      blurRadius: 12,
                      offset: Offset(0, 6),
                    ),
                  ]
                : null,
          ),
          child: Icon(
            icon,
            size: 24,
            color: active ? SweetsColors.white : SweetsColors.grayDarker,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontFamily: 'Geist',
            fontWeight: FontWeight.w400,
            fontSize: 12,
            height: 16 / 12,
            color: active ? SweetsColors.primary : const Color(0xFF475467),
          ),
        ),
      ],
    );
  }
}
