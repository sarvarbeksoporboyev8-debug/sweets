import 'package:flutter/material.dart';
import '../theme/sweets_theme.dart';
import '../constants/colors.dart';
import '../constants/spacing.dart';
import '../constants/gradients.dart';
import '../widgets/account/profile_header.dart';
import '../widgets/account/account_menu_item.dart';
import '../widgets/sweets_tab_bar.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SweetsColors.white, // Creamy background
      body: Column(
        children: [
          // White background header (no gradient)
          Container(
            color: SweetsColors.kTopBar, // Pure white
            child: SafeArea(
              bottom: false,
              child: ProfileHeader(
                name: 'John Doe',
                email: 'johndoe@gmail.com',
                avatarUrl: 'images/figma/713a293f-33da-4e36-8fc5-f95d8f3cc12f.png',
                onEditAvatar: () {
                  // TODO: Handle avatar edit
                },
              ),
            ),
          ),
          // Menu items
          Expanded(
            child: SafeArea(
              top: false,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: Spacing.md),
                child: Column(
                  children: [
                    AccountMenuItem(
                      icon: Icons.person_outline,
                      label: 'Personal Information',
                      onTap: () {
                        Navigator.of(context).pushNamed('/personalInformation');
                      },
                    ),
                    const SizedBox(height: Spacing.sm),
                    AccountMenuItem(
                      icon: Icons.shopping_bag_outlined,
                      label: 'Orders',
                      onTap: () {
                        Navigator.of(context).pushNamed('/orders');
                      },
                    ),
                    const SizedBox(height: Spacing.sm),
                    AccountMenuItem(
                      icon: Icons.favorite_outline,
                      label: 'Favorites',
                      onTap: () {
                        Navigator.of(context).pushNamed('/favorites');
                      },
                    ),
                    const SizedBox(height: Spacing.sm),
                    AccountMenuItem(
                      icon: Icons.location_on_outlined,
                      label: 'Addresses',
                      onTap: () {
                        Navigator.of(context).pushNamed('/addresses');
                      },
                    ),
                    const SizedBox(height: Spacing.sm),
                    LogoutMenuItem(
                      onTap: () {
                        // TODO: Handle logout
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Bottom navigation
          const SweetsTabBar(activeTab: 'Account'),
        ],
      ),
    );
  }
}
