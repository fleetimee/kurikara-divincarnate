import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:huixinapp/screen/home/home_ui.dart';

void main() {
  testWidgets('HomeItems widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: HomeItems(),
        ),
      ),
    );

    // check if the Active Students text is displayed
    expect(find.text('Active Students'), findsOneWidget);
  });
}
