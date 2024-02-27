import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_test/flutter_test.dart';
import 'package:bonvoyage/user_registration/user_registration_page.dart';

void main() {
  group('UserRegistrationPage', () {
    /// Test case to verify that the UserRegistrationPage is rendered correctly.
    /// It checks if all the necessary widgets and texts are present on the page.
    testWidgets('renders UserRegistrationPage correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: UserRegistrationPage()));

      expect(find.text('User Registration'), findsOneWidget);
      expect(find.text('Register an Account'), findsOneWidget);
      expect(find.text('Name'), findsOneWidget);
      expect(find.text('Email'), findsOneWidget);
      expect(find.text('Password'), findsOneWidget);
      expect(find.text('Confirm Password'), findsOneWidget);
      expect(find.text('Phone Number'), findsOneWidget);
      expect(find.text('Address'), findsOneWidget);
      expect(find.text('Register'), findsOneWidget);
      expect(find.text('Already have an account? Login'), findsOneWidget);
    });

    testWidgets('validates form fields correctly', (WidgetTester tester) async {
      /// This test code pumps a widget tree containing a [UserRegistrationPage] into the tester, and then simulates entering valid values into various text fields.
      /// The [name_field] is filled with 'John Doe', the [email_field] is filled with 'johndoe@example.com', the [password_field] and [confirm_password_field] are both filled with 'password', the [phone_number_field] is filled with '1234567890', and the [address_field] is filled with '123 Main St'.
      /// Finally, the widget tree is pumped again to reflect the changes made.
      await tester.pumpWidget(const MaterialApp(home: UserRegistrationPage()));

      // Enter valid values
      await tester.enterText(find.byKey(const Key('name_field')), 'John Doe');
      await tester.enterText(
          find.byKey(const Key('email_field')), 'johndoe@example.com');
      await tester.enterText(
          find.byKey(const Key('password_field')), 'password');
      await tester.enterText(
          find.byKey(const Key('confirm_password_field')), 'password');
      await tester.enterText(
          find.byKey(const Key('phone_number_field')), '1234567890');
      await tester.enterText(
          find.byKey(const Key('address_field')), '123 Main St');

      await tester.pump();

      // Verify no error messages
      expect(find.text('Please enter your name'), findsNothing);
      expect(find.text('Please enter your email'), findsNothing);
      expect(find.text('Please enter a password'), findsNothing);
      expect(find.text('Please confirm your password'), findsNothing);
      expect(find.text('Please enter your phone number'), findsNothing);
      expect(find.text('Please enter your address'), findsNothing);
    });

    testWidgets('enables register button when form is valid',
        (WidgetTester tester) async {
      /// This test case verifies the behavior of the user registration page.
      /// It pumps the widget tree with a MaterialApp containing the UserRegistrationPage,
      /// enters valid values into the input fields, and verifies that the register button is enabled.
      /// The test ensures that the user can successfully register with valid information.
      await tester.pumpWidget(const MaterialApp(home: UserRegistrationPage()));

      // Enter valid values
      await tester.enterText(find.byKey(const Key('name_field')), 'John Doe');
      await tester.enterText(
          find.byKey(const Key('email_field')), 'johndoe@example.com');
      await tester.enterText(
          find.byKey(const Key('password_field')), 'password');
      await tester.enterText(
          find.byKey(const Key('confirm_password_field')), 'password');
      await tester.enterText(
          find.byKey(const Key('phone_number_field')), '1234567890');
      await tester.enterText(
          find.byKey(const Key('address_field')), '123 Main St');

      await tester.pump();

      // Verify register button is enabled
      expect(find.byType(ElevatedButton), findsOneWidget);
      expect(tester.widget<ElevatedButton>(find.byType(ElevatedButton)).enabled,
          isTrue);
    });

    testWidgets('disables register button when form is invalid',
        (WidgetTester tester) async {
      /// This test case verifies the behavior of the user registration page when invalid values are entered into the input fields.
      /// It pumps the widget tree with a MaterialApp containing the UserRegistrationPage.
      /// Then, it enters empty values into the name, email, password, confirm password, phone number, and address fields.
      /// After each text entry, it pumps the widget tree to update the UI.
      /// Finally, it verifies that the register button is disabled by checking that only one ElevatedButton widget is found and its enabled property is false.
      await tester.pumpWidget(const MaterialApp(home: UserRegistrationPage()));

      // Enter invalid values
      await tester.enterText(find.byKey(const Key('name_field')), '');
      await tester.enterText(find.byKey(const Key('email_field')), '');
      await tester.enterText(find.byKey(const Key('password_field')), '');
      await tester.enterText(
          find.byKey(const Key('confirm_password_field')), '');
      await tester.enterText(find.byKey(const Key('phone_number_field')), '');
      await tester.enterText(find.byKey(const Key('address_field')), '');

      await tester.pump();

      // Verify register button is disabled
      expect(find.byType(ElevatedButton), findsOneWidget);
      expect(tester.widget<ElevatedButton>(find.byType(ElevatedButton)).enabled,
          isFalse);
    });
  });
}
