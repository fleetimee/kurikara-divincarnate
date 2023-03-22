// This is a test file for the `BottomNavigationBarButton` widget.
// The test checks if the widget renders correctly and if the `onTap` function is called when the widget is tapped.
// The test uses the `flutter_test` package to test the widget.
// The test creates a `MaterialApp` with a `Scaffold` that has a `BottomNavigationBarButton` widget.
// The widget has a name, color, and an `onTap` function.
// The test uses the `tester.pumpWidget` method to pump the widget tree and the `tester.tap` method to simulate a tap on the widget.
// The test then checks if the `onTap` function is called by checking the value of the `onTapCalled` variable.
// The test passes if the widget renders correctly and the `onTap` function is called when the widget is tapped.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:huixinapp/widget/bottom_appbar_button.dart';

void main() {
  testWidgets('BottomNavigationBarButton should render correctly',
      (WidgetTester tester) async {
    const name = 'Test Name';
    const color = Colors.blue;
    var onTapCalled = false;
    void onTap() {
      onTapCalled = true;
    }

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          bottomNavigationBar: BottomNavigationBarButton(
            name: name,
            color: color,
            onTap: onTap,
          ),
        ),
      ),
    );

    final textFinder = find.text(name);
    expect(textFinder, findsOneWidget);

    final inkWellFinder = find.byType(InkWell);
    expect(inkWellFinder, findsOneWidget);

    await tester.tap(inkWellFinder);
    expect(onTapCalled, isTrue);
  });
}
