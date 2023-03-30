import 'package:ToDo/model/passcodeModel.dart';
import 'package:ToDo/screens/introScreens/introPage2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
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

  testWidgets('introPage2 displays two buttons', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: IntroPage2()));
    expect(find.widgetWithText(ElevatedButton, 'CONTINUE WITH AUTHORIZATION'), findsOneWidget);
    expect(find.widgetWithText(ElevatedButton, 'CONTINUE WITHOUT AUTHORIZATION'), findsOneWidget);
  });

  tearDown(() async {
    await Hive.box<PasscodeModel>('Passcode').close();
  });
}