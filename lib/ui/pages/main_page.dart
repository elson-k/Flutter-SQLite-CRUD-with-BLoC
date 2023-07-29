import 'package:flutter/material.dart';
import 'package:flutter_sqflite_crud/ui/widgets/add_bottom_sheet.dart';
import 'package:flutter_sqflite_crud/ui/widgets/todo_card_widget.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  List<String> todos = ["How to cook", "Jump up  and down"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        height: double.maxFinite,
        child: ListView.builder(
            itemCount: todos.length,
            itemBuilder: (BuildContext context, int index) {
              return TodoCard(
                title: todos[index],
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context, builder: (context) => AddBottomSheet());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
