import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:huixinapp/widget/pageroute.dart';

void main() {
  testWidgets('Fade Page Route Transition Test', (WidgetTester tester) async {
    final widgetKey = UniqueKey();

    await tester.pumpWidget(
      MaterialApp(
        home: Container(
          key: widgetKey,
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(tester.element(find.byKey(widgetKey))).push(
                FadePageRoute(builder: (BuildContext context) => Container()),
              );
            },
            child: const Text('Open Page'),
          ),
        ),
      ),
    );

    expect(find.byType(ElevatedButton), findsOneWidget);

    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle(const Duration(milliseconds: 600));

    expect(find.byType(Container), findsOneWidget);

    await tester.tap(find.byType(Container));
    await tester.pumpAndSettle(const Duration(milliseconds: 600));

    expect(find.byType(Container), findsNothing);
  });
}
