import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';

void main() {
  group('Login Widget Tests', () {
    testWidgets('Initial state', (WidgetTester tester) async {
      // Test the initial state of the login widget
      await tester.pumpWidget(MaterialApp(home: LoginPage()));

      // Verify that the login form is displayed
      expect(find.byType(LoginForm), findsOneWidget);

      // Verify that the login button is disabled
      expect(find.byType(ElevatedButton), findsOneWidget);
      final loginButton = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      expect(loginButton.enabled, isFalse);
    });

    testWidgets('Valid input', (WidgetTester tester) async {
      // Test the login widget with valid input
      await tester.pumpWidget(MaterialApp(home: LoginPage()));

      // Enter valid email and password
      await tester.enterText(find.byKey(const Key('emailField')), 'test@example.com');
      await tester.enterText(find.byKey(const Key('passwordField')), 'password');
      await tester.pump();

      // Verify that the login button is enabled
      final loginButton = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      expect(loginButton.enabled, isTrue);

      // Tap the login button
      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      // Verify that the login request is sent
      // Add your own assertions here based on your implementation
    });

    testWidgets('Invalid input', (WidgetTester tester) async {
      // Test the login widget with invalid input
      await tester.pumpWidget(MaterialApp(home: LoginPage()));

      // Enter invalid email and password
      await tester.enterText(find.byKey(const Key('emailField')), 'invalidemail');
      await tester.enterText(find.byKey(const Key('passwordField')), 'short');
      await tester.pump();

      // Verify that the login button is disabled
      final loginButton = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      expect(loginButton.enabled, isFalse);

      // Tap the login button
      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      // Verify that no login request is sent
      // Add your own assertions here based on your implementation
    });
  });
}