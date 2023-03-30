import 'package:ToDo/model/passcodeModel.dart';
import 'package:ToDo/screens/passcode/passcodeSettingsScreen.dart';
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

  testWidgets('Passcode settings screen', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: PasscodeSettingsScreen()));
    final Finder changePasscodeButton =
    find.widgetWithText(ListTile, 'Change passcode');
    final Finder deletePasscodeButton =
    find.widgetWithText(ListTile, 'Delete passcode');

    expect(changePasscodeButton, findsOneWidget);
    expect(deletePasscodeButton, findsOneWidget);
});
}




