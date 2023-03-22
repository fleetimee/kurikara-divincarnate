import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:huixinapp/widget/container_course.dart';

void main() {
  group('ContainerCourse widget test', () {
    const text = 'Test Text';
    const color = Colors.blue;
    const containerCourse = ContainerCourse(text: text, color: color);

    testWidgets('should render a Container with given text and color',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: containerCourse,
        ),
      );

      final containerFinder = find.byType(Container);
      final textFinder = find.text(text);

      expect(containerFinder, findsOneWidget);
      expect(textFinder, findsOneWidget);

      // expect return Test Text
      expect(find.text('Test Text'), findsOneWidget);
    });
  });
}
