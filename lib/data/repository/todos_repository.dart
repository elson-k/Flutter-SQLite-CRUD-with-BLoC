
import 'package:flutter_sqflite_crud/data/model/todo_model.dart';
import 'package:flutter_sqflite_crud/data/provider/sqlite/todos_api.dart';

class TodosRepository {
  late final TodosApi todosApi;

  Future<List<Todo>> getAllTodos() async {
    return await todosApi.todos();
  }

  Future<void> addTodo(Todo todo) async {
    await todosApi.insertTodo(todo);
  }

  Future<void> deleteTodo(String id) async {
    await todosApi.deleteTodo(id);
  }
  Future<Todo?> getTodo(String id) async{
    return await todosApi.read(id);
  }
}
