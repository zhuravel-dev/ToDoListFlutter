import 'package:ToDo/dbForRegistrationSQL/userModel.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SQLiteDB {

  static Database? _database;
  final String tableName = 'users';

  Future<Database> get database async =>
      _database ??= await _initializeDB();

  _initializeDB() async {
    String dataBasePath = await getDatabasesPath();
    String path = join(dataBasePath, tableName);
    var theDB = await openDatabase(path, version: 1, onCreate: _onCreate);
    print("Successful initialize");
    return theDB;
  }

  void _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE Users(id INTEGER PRIMARY KEY AUTOINCREMENT,"
        "login TEXT NOT NULL,"
        "password TEXT)");
    print("Successful create");
  }

  // CREATE
  Future<int?> newUser(String login, String password) async {
    final db = await database;
    var raw = await db.rawInsert(
        "INSERT Into users (login, password)"
            "VALUES ('${login}', '${password}')");
    print("Successful create");
    return raw;
  }

  // READ
  Future<List> getUser() async {
    var dbClient = await database;
    List<Map> data = await dbClient.rawQuery('SELECT * FROM $tableName');
    return data.toList();
  }

  //UPDATE
  Future<int> updateLogin(login) async {
    //Db create/table create
    var db = await database;
    var status = await db.rawUpdate("update product set login=?",[login]);
    print("Successful update");
    return status;
  }

  //UPDATE
  Future<int> updatePassword(password) async {
    //Db create/table create
    var db = await database;
    var status = await db.rawUpdate("update product set password=?",[password]);
    print("Successful update");
    return status;
  }


  // DELETE
   Future<int> deleteUser(int id) async {
     var db = await database;
     var status = await db.rawDelete("delete from users.db wher e id=?",[id]);
     print("Successful delete");
     return status;
   }

   //CHECK DATABASE
  Future<void> openDatabaseAndPrintContent() async {
    final db = await openDatabase('users');
    final content = await db.rawQuery('SELECT * FROM users');
    print(content);
    await db.close();
  }

}
