import 'package:ToDo/dbForRegistrationSQL/SQLiteDB.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:mockito/annotations.dart';

class MockDatabase extends Mock implements Database {}

@GenerateMocks([SQLiteDB], customMocks: [])
    void main() {
      WidgetsFlutterBinding.ensureInitialized();
      group('_initializeDB', () {
        test('should return a valid database instance when called', () async {
          final mockDatabase = MockDatabase();
          final mockPath = 'path/to/database';
          final mockTableName = 'testTable';

         //when(await getDatabasesPath()).thenReturn(mockPath);
          when(join(mockPath, mockTableName)).thenReturn(mockPath);
          when(await openDatabase(mockPath, version: 1, onCreate: anyNamed('onCreate')))
              .thenReturn(mockDatabase);

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