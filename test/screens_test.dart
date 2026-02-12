import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sweets_flutter/screens/product_detail_screen.dart';
import 'package:sweets_flutter/screens/cart_empty_screen.dart';
import 'package:sweets_flutter/screens/no_connection_screen.dart';

void main() {
  group('Batch 6 Refactored Screens Tests', () {
    testWidgets('ProductDetailScreen renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: ProductDetailScreen(),
        ),
      );

      // Verify key elements are present
      expect(find.text('Blueberry pie'), findsOneWidget);
      expect(find.text('Add to cart'), findsOneWidget);
      expect(find.text('Add your rating'), findsOneWidget);
      expect(find.byIcon(Icons.arrow_back_ios_new_rounded), findsOneWidget);
    });

    testWidgets('ProductDetailScreen quantity controls work', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: ProductDetailScreen(),
        ),
      );

      // Find increment button
      final incrementButton = find.byIcon(Icons.add_circle_outline);
      expect(incrementButton, findsOneWidget);

      // Initial quantity should be 01
      expect(find.text('01'), findsOneWidget);

      // Tap increment
      await tester.tap(incrementButton);
      await tester.pump();

      // Quantity should now be 02
      expect(find.text('02'), findsOneWidget);
    });

    testWidgets('ProductDetailScreen favorite toggle works', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: ProductDetailScreen(),
        ),
      );

      // Find favorite button (should be unfilled initially)
      expect(find.byIcon(Icons.favorite_border), findsOneWidget);

      // Tap favorite button
      await tester.tap(find.byIcon(Icons.favorite_border));
      await tester.pump();

      // Should now show filled favorite icon
      expect(find.byIcon(Icons.favorite), findsOneWidget);
    });

    testWidgets('CartEmptyScreen renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CartEmptyScreen(),
        ),
      );

      // Verify empty state text
      expect(find.text('Unfortunately!'), findsOneWidget);
      expect(find.text('The cart is empty. Try exploring the products now.'), findsOneWidget);
      
      // Verify tab bar
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Cart'), findsOneWidget);
    });

    testWidgets('NoConnectionScreen renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: NoConnectionScreen(),
        ),
      );

      // Verify empty state text
      expect(find.text('There is a problem.'), findsOneWidget);
      expect(find.text('Try again'), findsOneWidget);
      expect(find.byIcon(Icons.refresh), findsOneWidget);
    });

    testWidgets('NoConnectionScreen retry button works', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: NoConnectionScreen(),
        ),
      );

      // Find retry button
      final retryButton = find.text('Try again');
      expect(retryButton, findsOneWidget);

      // Tap retry button
      await tester.tap(retryButton);
      await tester.pump();

      // Should show loading state
      expect(find.text('Retrying...'), findsOneWidget);
      
      // Wait for retry to complete
      await tester.pumpAndSettle(const Duration(seconds: 3));
      
      // Should be back to normal state
      expect(find.text('Try again'), findsOneWidget);
    });
  });
}
