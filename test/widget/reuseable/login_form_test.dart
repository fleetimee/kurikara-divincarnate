import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:huixinapp/widget/login_form.dart';

void main() {
  group('LoginForm widget test', () {
    testWidgets('Check form field presence', (WidgetTester tester) async {
      // Build the widget.
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: LoginForm(
              label: 'Email',
              obscureText: 'false',
            ),
          ),
        ),
      );

      // Check if form field for email exists.
      expect(find.byType(FormBuilderTextField), findsOneWidget);
      expect(find.text('Email'), findsOneWidget);
    });

    testWidgets('Check obscure form field presence',
        (WidgetTester tester) async {
      // Build the widget.
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: LoginForm(
              label: 'Password',
              obscureText: 'true',
            ),
          ),
        ),
      );

      // Check if obscure form field exists.
      expect(find.byType(FormBuilderTextField), findsOneWidget);
      expect(find.text('Password'), findsOneWidget);
    });

    testWidgets('Check if validation works', (WidgetTester tester) async {
      // Inject validation failure into form field.
      final form = GlobalKey<FormBuilderState>();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FormBuilder(
              key: form,
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                children: const [
                  LoginForm(
                    label: 'Email',
                    key: Key('email'),
                    obscureText: 'false',
                  ),
                ],
              ),
            ),
          ),
        ),
      );
      form.currentState!.saveAndValidate();

      // Inject valid input into form field.
      final emailField = find.byKey(const Key('email'));
      await tester.enterText(emailField, 'test@test.com');
      form.currentState!.saveAndValidate();

      // Check if validation accepts valid input and does not return error message.
      expect(find.text('Please enter a value'), findsNothing);
    });
  });
}

Matcher fu(
  WidgetTester tester,
  dynamic Function(String) function,
) {
  return predicate(
    (dynamic key) {
      final widget = tester.widget<FormBuilderTextField>(find.byKey(Key(key)));
      return function(widget.name.toString());
    },
  );
}
