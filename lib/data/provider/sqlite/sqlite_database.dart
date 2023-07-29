import 'package:flutter_sqflite_crud/constants/sql_commands.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';



class SqliteDatabase {
  late Database _database;

  Future<Database> get instance async {
    if (_database != null) {
      return _database;
    }
    _database = await _init();
    return _database;
  }

  Future<Database> _init() async {
    final path = await _databasePath;
    var database = openDatabase(
      path,
      version: 1,
      onCreate: (database, version) {
        database.execute(SqlCommands.CREATE_TODO_TABLE);
      },
      singleInstance: true,
    );
    return database;
  }

  Future<String> get _databasePath async {
    const name = "todos_database.db";
    final path = await getDatabasesPath();
    return join(path, name);
  }
}
