import 'package:ToDo/model/toDoModel.dart';
import 'package:ToDo/screens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  final directory = await getTemporaryDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(ToDoModelAdapter());

  group('Home Screen', () {
    setUp(() async {
      await Hive.openBox<ToDoModel>('ToDoApp');
    });

    testWidgets('should display the app bar', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: HomeScreen()));
      expect(find.byType(AppBar), findsOneWidget);
    });

    testWidgets('should display the app bar title', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: HomeScreen()));
      final appBarTitleFinder = find.text('To Do List');
      expect(appBarTitleFinder, findsOneWidget);
    });

    testWidgets('should display the calendar icon button', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: HomeScreen()));
      final calendarButtonFinder = find.byIcon(Icons.calendar_month);
      expect(calendarButtonFinder, findsOneWidget);
    });

    testWidgets('should display the search bar', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: HomeScreen()));
      final searchBarFinder = find.byType(TextField);
      expect(searchBarFinder, findsOneWidget);
    });

    testWidgets('should display the add button', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: HomeScreen()));
      final addButtonFinder = find.byIcon(Icons.add);
      expect(addButtonFinder, findsOneWidget);
    });

    testWidgets('should display the settings icon button',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: HomeScreen()));
      final settingsButtonFinder = find.byIcon(Icons.settings);
      expect(settingsButtonFinder, findsOneWidget);
    });

    testWidgets('should display the bottom bar', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: HomeScreen()));
      expect(find.byType(BottomAppBar), findsOneWidget);
    });

  });

  tearDownAll(() async {
    await Hive.box<ToDoModel>('ToDoApp').close();
  });
}
