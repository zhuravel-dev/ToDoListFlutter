import 'package:ToDo/screens/registerScreen/registerScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {

  testWidgets('should display the app bar', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: RegisterScreen()));
    expect(find.byType(AppBar), findsOneWidget);
  });

  testWidgets('should display the app bar title', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: RegisterScreen()));
    final appBarTitleFinder = find.text('Registration');
    expect(appBarTitleFinder, findsOneWidget);
  });

  testWidgets('should display text', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: RegisterScreen()));
    final welcomeText = find.text('Please, enter you personal data');
    expect(welcomeText, findsOneWidget);
  });

  testWidgets('textField for login input displayed', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: RegisterScreen()));
    final textField = find.byKey(const Key('loginForm_usernameInput_textField'));
    await tester.enterText(textField, 'testusername');
  });

  testWidgets('textField for password input displayed', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: RegisterScreen()));
    final textField = find.byKey(const Key('loginForm_passwordInput_textField'));
    await tester.enterText(textField, 'testpassword');
  });



}