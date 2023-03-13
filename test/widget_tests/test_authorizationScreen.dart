import 'package:ToDo/screens/authorizationScreen/authorizationScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {

  testWidgets('should display the app bar', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: AuthorizationScreen()));
    expect(find.byType(AppBar), findsOneWidget);
  });

  testWidgets('should display the app bar title', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: AuthorizationScreen()));
    final appBarTitleFinder = find.text('Authorization');
    expect(appBarTitleFinder, findsOneWidget);
  });

  testWidgets('should display welcome text', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: AuthorizationScreen()));
    final welcomeText = find.text('Hello again!');
    expect(welcomeText, findsOneWidget);
  });

  testWidgets('should display text "welcome back"', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: AuthorizationScreen()));
    final welcomeBackText = find.text('Welcome back!');
    expect(welcomeBackText, findsOneWidget);
  });

  testWidgets('textField for login input displayed', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: AuthorizationScreen()));
    final textField = find.byKey(const Key('loginForm_usernameInput_textField'));
    await tester.enterText(textField, 'testusername');
  });

  testWidgets('textField for password input displayed', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: AuthorizationScreen()));
    final textField = find.byKey(const Key('passwordForm_passwordInput_textField'));
    await tester.enterText(textField, 'testpassword');
  });

  testWidgets('button with text "sing in" displayed', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: AuthorizationScreen()));
    final buttonKey = const Key('loginForm_continue_raisedButton');
    final loginButton = find.byKey(buttonKey);
    expect(loginButton, findsOneWidget);
    expect(find.text('Sing in'), findsOneWidget);
  });

  testWidgets('should display text "Not a member?"', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: AuthorizationScreen()));
    final underButtonText = find.text('Not a member?');
    expect(underButtonText, findsOneWidget);
  });

  testWidgets('should display text "register now"', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: AuthorizationScreen()));
    final richTextFinder = find.byWidgetPredicate((widget) =>
    widget is RichText && widget.text.toPlainText() == ' Register now');
    expect(richTextFinder, findsOneWidget);
  });

}