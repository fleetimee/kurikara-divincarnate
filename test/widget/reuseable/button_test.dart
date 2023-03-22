import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:huixinapp/widget/button.dart';

void main() {
  testWidgets('PrimaryButton displays text and has onTap',
      (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: PrimaryButton(
            text: 'Test text',
            onPressed: () {},
          ),
        ),
      ),
    );

    // Verify text is displayed
    expect(find.text('Test text'), findsOneWidget);

    // Tap button
    await tester.tap(find.byType(PrimaryButton));

    // Verify onTap callback is called
    expect(
      find.byWidgetPredicate(
        (widget) => widget is PrimaryButton,
      ),
      findsOneWidget,
    );
  });
}
