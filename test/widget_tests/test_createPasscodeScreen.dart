import 'package:ToDo/screens/passcode/createPasscodeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Display right title and button', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: CreatePasscodeScreen()));
    expect(find.text('Passcode help you protect your data.'), findsOneWidget);
    expect(find.text('Please don\'t forget your passcode'), findsOneWidget);
    expect(find.text('or your data will be lost.'), findsOneWidget);
    expect(find.text('Create passcode'), findsOneWidget);
    expect(find.widgetWithText(ElevatedButton, 'CREATE PASSCODE'), findsOneWidget);
  });

}