import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:to_do_app/core/views/Onboard/components/custom_signIn_Dialog.dart';
import 'package:to_do_app/core/views/Onboard/components/sign_in_form.dart';
import 'package:to_do_app/core/views/Onboard/components/sign_up_form.dart';

void main() {
  testWidgets('Custom delete note test Successful',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (BuildContext context) {
              return ElevatedButton(
                onPressed: () {
                  customSignInDialog(context, onClosed: (ei) {});
                },
                child: Text('Open dialog'),
              );
            },
          ),
        ),
      ),
    );

    // Tap the button to open the dialog
    await tester.tap(find.text('Open dialog'));
    await tester.pumpAndSettle();

    // Check that the initial form is the sign-in form
    expect(find.byType(SignInForm), findsOneWidget);
    expect(find.byType(SignUpForm), findsNothing);

    // Tap the "Sign Up" button to switch to the sign-up form
    await tester.tap(find.text('Sign Up'));
    await tester.pumpAndSettle();

    // Check that the form has switched to the sign-up form
    expect(find.byType(SignInForm), findsNothing);
    expect(find.byType(SignUpForm), findsOneWidget);
  });
}
