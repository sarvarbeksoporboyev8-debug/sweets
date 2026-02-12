import 'package:flutter/material.dart';

import 'screens/contact_us_screen.dart';
import 'screens/notifications_empty_screen.dart';
import 'screens/welcome_splash_screen.dart';
// Old variant screens - kept for backward compatibility
import 'screens/walkthrough_screen_01.dart';
import 'screens/walkthrough_screen_02.dart';
import 'screens/walkthrough_screen_03.dart';
import 'screens/login_screen_01.dart';
import 'screens/login_screen_02.dart';
import 'screens/login_screen_03.dart';
import 'screens/login_screen_04.dart';
// New consolidated screens
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/otp_verification_screen.dart';
import 'screens/walkthrough_screen.dart';
import 'screens/login_success_screen.dart';
import 'screens/complete_profile_screen_01.dart';
import 'screens/complete_profile_screen_06.dart';
import 'screens/categories_screen.dart';
import 'screens/home_screen.dart';
import 'screens/explore_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/cart_empty_screen.dart';
import 'screens/favorites_screen.dart';
import 'screens/favorites_empty_screen.dart';
import 'screens/account_screen.dart';
import 'screens/product_detail_screen.dart';
import 'screens/no_connection_screen.dart';
import 'screens/checkout_payment_method_screen.dart';
import 'screens/checkout_payment_info_screen.dart';
import 'screens/checkout_delivery_address_screen.dart';
import 'screens/checkout_order_summary_screen.dart';
import 'screens/checkout_success_screen.dart';
import 'screens/track_order_screen.dart';
import 'screens/track_order_delivered_screen.dart';
import 'screens/personal_information_screen.dart';
import 'screens/addresses_screen.dart';
import 'screens/orders_screen.dart';
import 'screens/rating_products_screen.dart';
import 'screens/notifications_screen.dart';
import 'screens/about_us_screen.dart';
import 'screens/rate_the_app_screen.dart';
import 'screens/add_notes_screen.dart';
import 'screens/contact_us_screen.dart';
import 'screens/signup_screen_01.dart';
import 'screens/signup_screen_02.dart';
import 'screens/signup_screen_03.dart';
import 'screens/otp_verification_screen_01.dart';
import 'screens/otp_verification_screen_02.dart';
import 'screens/otp_verification_screen_03.dart';
import 'screens/signup_success_screen.dart';
import 'theme/sweets_theme.dart';

void main() {
  runApp(const SweetsApp());
}

class SweetsApp extends StatelessWidget {
  const SweetsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sweets',
      debugShowCheckedModeBanner: false,
      theme: buildSweetsTheme(),
      // For now start directly on the Home screen.
      initialRoute: '/',
      routes: {
        '/': (_) => const HomeScreen(),
        '/home': (_) => const HomeScreen(),
        '/welcome': (_) => const WelcomeSplashScreen(),
        // New consolidated screens (preferred)
        '/walkthrough': (_) => const WalkthroughScreen(),
        '/login': (_) => const LoginScreen(),
        '/signup': (_) => const SignupScreen(),
        '/otp': (_) => const OtpVerificationScreen(),
        // Old variant screens (backward compatibility)
        '/walkthrough01': (_) => const WalkthroughScreen01(),
        '/walkthrough02': (_) => const WalkthroughScreen02(),
        '/walkthrough03': (_) => const WalkthroughScreen03(),
        '/login01': (_) => const LoginScreen01(),
        '/login02': (_) => const LoginScreen02(),
        '/login03': (_) => const LoginScreen03(),
        '/login04': (_) => const LoginScreen04(),
        '/loginSuccess': (_) => const LoginSuccessScreen(),
        '/signup01': (_) => const SignupScreen01(),
        '/signup02': (_) => const SignupScreen02(),
        '/signup03': (_) => const SignupScreen03(),
        '/otp01': (_) => const OtpVerificationScreen01(),
        '/otp02': (_) => const OtpVerificationScreen02(),
        '/otp03': (_) => const OtpVerificationScreen03(),
        '/signupSuccess': (_) => const SignupSuccessScreen(),
        // Profile screens
        '/completeProfile01': (_) => const CompleteProfileScreen01(),
        '/completeProfile06': (_) => const CompleteProfileScreen06(),
        // Main app screens
        '/explore': (_) => const ExploreScreen(),
        '/categories': (_) => const CategoriesScreen(),
        '/cart': (_) => const CartScreen(),
        '/cartEmpty': (_) => const CartEmptyScreen(),
        '/favorites': (_) => const FavoritesScreen(),
        '/favoritesWithAlert': (_) => const FavoritesScreen(showSuccessAlert: true),
        '/favoritesEmpty': (_) => const FavoritesEmptyScreen(),
        '/account': (_) => const AccountScreen(),
        '/productDetail': (_) => const ProductDetailScreen(),
        '/noConnection': (_) => const NoConnectionScreen(),
        // Checkout flow
        '/checkoutPaymentMethod': (_) => const CheckoutPaymentMethodScreen(),
        '/checkoutPaymentInfo': (_) => const CheckoutPaymentInfoScreen(),
        '/checkoutDeliveryAddress': (_) => const CheckoutDeliveryAddressScreen(),
        '/checkoutDeliveryAddressWithModal': (_) => const CheckoutDeliveryAddressScreen(showAddAddressModal: true),
        '/checkoutOrderSummary': (_) => const CheckoutOrderSummaryScreen(),
        '/checkoutSuccess': (_) => const CheckoutSuccessScreen(),
        // Order tracking
        '/trackOrder': (_) => const TrackOrderScreen(),
        '/trackOrderDelivered': (_) => const TrackOrderDeliveredScreen(),
        '/trackOrderWithModal': (_) => const TrackOrderScreen(showDeliveredModal: true),
        // Account management
        '/personalInformation': (_) => const PersonalInformationScreen(),
        '/personalInformationWithAlert': (_) => const PersonalInformationScreen(showSuccessAlert: true),
        '/addresses': (_) => const AddressesScreen(),
        '/orders': (_) => const OrdersScreen(),
        '/ratingProducts': (_) => const RatingProductsScreen(),
        '/notifications': (_) => const NotificationsScreen(),
        '/notificationsEmpty': (_) => const NotificationsEmptyScreen(),
        // Other screens
        '/aboutUs': (_) => const AboutUsScreen(),
        '/rateTheApp': (_) => const RateTheAppScreen(),
        '/addNotes': (_) => const AddNotesScreen(),
        '/contactUs': (_) => const ContactUsScreen(),
        '/contact': (_) => const ContactUsScreen(),
      },
    );
  }
}

