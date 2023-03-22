import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:huixinapp/widget/navigator_style.dart';

void main() {
  testWidgets('NavigatorBar - Tap on tab item should change selected tab',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: NavigatorBar(
          currentIndex: 0,
        ),
      ),
    );

    expect(find.text('Home'), findsOneWidget);

    await tester.tap(find.byIcon(FontAwesomeIcons.bullseye));
    await tester.pumpAndSettle();

    expect(find.text('Likes'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.people));
    await tester.pumpAndSettle();

    expect(find.text('Search'), findsOneWidget);
  });
}
