import 'package:ToDo/screens/introScreens/introPage1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('introPage1 displays welcome message and image', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: IntroPage1()));
    expect(find.text('WELCOME TO APP!'), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
    final image = tester.widget<Image>(find.byType(Image));
    expect(image.image, AssetImage('assets/images/productivity.jpg'));
    expect(find.text('BE MORE PRODUCTIVE WITH TODO!'), findsOneWidget);
  });
}