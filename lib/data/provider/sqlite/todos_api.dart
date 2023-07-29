
import 'package:flutter_sqflite_crud/data/model/todo_model.dart';
import 'package:flutter_sqflite_crud/data/provider/sqlite/sqlite_database.dart';
import 'package:sqflite/sqflite.dart';

class TodosApi {

  Future<void> insertTodo(Todo todo) async{
    final db=await SqliteDatabase().instance;
    await db.insert("todos",todo.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> deleteTodo(String id) async {
    final db =await SqliteDatabase().instance;
    await db.delete(
      'todos',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<Todo>> todos() async {
    final db=await SqliteDatabase().instance;
    final List<Map<String, dynamic>> maps = await db.query('todos');
    return List.generate(maps.length, (i) {
      return Todo(
        id: maps[i]['id'],
        title: maps[i]['title'],
      );
    });
  }

  Future<void> updateTodo(Todo todo) async{
      final db = await SqliteDatabase().instance;
      await db.update(
        'todos',
        todo.toMap(),
        where: 'id = ?',
        whereArgs: [todo.id],
      );
  }

  Future<Todo?> read(String id) async {
    final db = await SqliteDatabase().instance;
    final List<Map<String, dynamic>> maps = await db.query(
      'todos',
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isEmpty) {
      return null;
    }
    return Todo(
      id: maps[0]['id'],
      title: maps[0]['title'],
    );
  }

}