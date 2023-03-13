import 'package:ToDo/model/passcodeModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ToDo/screens/settingsScreen.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  final directory = await getTemporaryDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(PasscodeModelAdapter());

  setUp(() async {
    await Hive.openBox<PasscodeModel>('Passcode');
  });

  testWidgets('should display the app bar', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: SettingsScreen()));
    expect(find.byType(AppBar), findsOneWidget);
  });

  testWidgets('should display the app bar title', (WidgetTester tester) async {
        await tester.pumpWidget(MaterialApp(home: SettingsScreen()));
        final appBarTitleFinder = find.text('Settings');
        expect(appBarTitleFinder, findsOneWidget);
      });

  group('widgets and icons', () {
    testWidgets('should display widget and icon "App colors"',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: SettingsScreen()));
      final appColorsWidget = find.text('App colors');
      expect(appColorsWidget, findsOneWidget);
      final appColorsIcon = find.byIcon(Icons.color_lens_outlined);
      expect(appColorsIcon, findsOneWidget);
    });

    testWidgets('should display widget and icon "Security"',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: SettingsScreen()));
      expect(find.text("Security"), findsOneWidget);
      expect(find.byIcon(Icons.security), findsOneWidget);
    });
  });

  tearDown(() async {
    await Hive.box<PasscodeModel>('Passcode').close();
  });
}