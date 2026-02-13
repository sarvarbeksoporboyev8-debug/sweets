import 'package:flutter/material.dart';
import '../theme/sweets_theme.dart';
import '../constants/colors.dart';
import '../constants/spacing.dart';
import '../constants/gradients.dart';
import '../widgets/account/account_menu_item.dart';
import '../widgets/sweets_tab_bar.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  void _showLanguageSelector(BuildContext context) {
    final languages = [
      {'code': 'uz', 'name': 'Uz'},
      {'code': 'uz_cyrill', 'name': 'Uz-cyrill'},
      {'code': 'ru', 'name': 'Russian'},
      {'code': 'en', 'name': 'English'},
    ];

    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.symmetric(vertical: Spacing.lg),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: languages.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: const Icon(
                Icons.language,
                color: Color(0xFFFF7F6B),
              ),
              title: Text(languages[index]['name']!),
              onTap: () {
                // TODO: Change language
                Navigator.pop(context);
              },
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SweetsColors.white,
      body: Column(
        children: [
          // New account header design
          Container(
            color: SweetsColors.white,
            child: SafeArea(
              bottom: false,
              child: Column(
                children: [
                  // SECTION 1: Language Selector + Profil Title
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Spacing.lg,
                      vertical: Spacing.md,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Left: Language Selector
                        GestureDetector(
                          onTap: () => _showLanguageSelector(context),
                          child: const Row(
                            children: [
                              Icon(
                                Icons.language,
                                color: SweetsColors.cardCyan,
                                size: 24,
                              ),
                              SizedBox(width: 8),
                              Text(
                                'Uz',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: SweetsColors.cardCyan,
                                ),
                              ),
                            ],
                          ),
                        ),
                        
                        // Center: Profil Title
                        const Text(
                          'Profil',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Colors.black87,
                          ),
                        ),
                        
                        // Right: Spacer for balance
                        const SizedBox(width: 60),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: Spacing.lg),
                  
                  // SECTION 2: User Profile Card
                  Container(
                    color: SweetsColors.white,
                    padding: const EdgeInsets.all(Spacing.lg),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Avatar Circle with white dots
                        Container(
                          width: 100,
                          height: 100,
                          decoration: const BoxDecoration(
                            color: SweetsColors.cardPurple,
                            shape: BoxShape.circle,
                          ),
                          child: const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // White dot 1
                                CircleAvatar(
                                  radius: 5,
                                  backgroundColor: Colors.white,
                                ),
                                SizedBox(height: 12),
                                // White dot 2
                                CircleAvatar(
                                  radius: 5,
                                  backgroundColor: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                        
                        const SizedBox(width: Spacing.lg),
                        
                        // Name + Phone
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Name
                              Text(
                                'Sarvarbek Soporboyev',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              
                              SizedBox(height: 12),
                              
                              // Phone
                              Row(
                                children: [
                                  Icon(
                                    Icons.phone_outlined,
                                    color: SweetsColors.cardPeach,
                                    size: 18,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    '95 047 1202',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: Spacing.lg),
                ],
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
        ],
      ),
      bottomNavigationBar: SweetsTabBar(
        activeTab: 'Account',
        onTabTap: (tab) {
          switch (tab) {
            case 'Home':
              Navigator.pushReplacementNamed(context, '/home');
              break;
            case 'Explore':
              Navigator.pushReplacementNamed(context, '/explore');
              break;
            case 'Favorites':
              Navigator.pushReplacementNamed(context, '/favorites');
              break;
            case 'Cart':
              Navigator.pushReplacementNamed(context, '/cart');
              break;
            case 'Account':
              // Already on account, do nothing
              break;
          }
        },
      ),
    );
  }
}
