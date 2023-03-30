import 'package:ToDo/model/toDoModel.dart';
import 'package:ToDo/screens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/mockito.dart';
import 'package:path_provider/path_provider.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  final tempDir = await getTemporaryDirectory();
  Hive.init(tempDir.path);
  Hive.registerAdapter(ToDoModelAdapter());
  var mockObserver = MockNavigatorObserver();

  setUpAll(() async {
    await Hive.openBox<ToDoModel>('testBox');
  });

  testWidgets('when add button pressed than an alert dialog displays', (WidgetTester tester) async {

    // arrange
    await tester.pumpWidget(MaterialApp(home: HomeScreen(), navigatorObservers: [mockObserver],),
    );

    // act
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // assert
    expect(find.byType(AlertDialog), findsOneWidget);
  });
}