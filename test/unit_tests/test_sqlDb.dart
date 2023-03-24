import 'package:ToDo/dbForRegistrationSQL/SQLiteDB.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class MockDatabase extends Mock implements Database {}

    void main() {
      WidgetsFlutterBinding.ensureInitialized();
      group('_initializeDB', () {
        test('should return a valid database instance when called', () async {
          final mockDatabase = MockDatabase();
          final mockPath = 'path/to/database';
          final mockTableName = 'testTable';

          // Stub the dependencies.
          when(await getDatabasesPath()).thenReturn(mockPath);
          when(join(mockPath, mockTableName)).thenReturn(mockPath);
          when(await openDatabase(mockPath, version: 1, onCreate: anyNamed('onCreate')))
              .thenReturn(mockDatabase);

          // Call the method under test.
          final SQLiteDB sqliteDb = SQLiteDB();
          final result = await sqliteDb.initializeDB();

          // Verify the result.
          expect(result, mockDatabase);
          verify(await getDatabasesPath());
          verify(join(mockPath, mockTableName));
          verify(await openDatabase(mockPath, version: 1, onCreate: anyNamed('onCreate')));
        });
      });

}