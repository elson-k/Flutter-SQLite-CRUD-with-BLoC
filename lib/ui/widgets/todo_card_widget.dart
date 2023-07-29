import 'package:flutter/material.dart';

class TodoCard extends StatefulWidget {


  const TodoCard({required this.title,Key?key}):super(key:key);

  final String title;

  @override
  State<TodoCard> createState() => _TodoCardState();
}
enum _MenuItems{update,delete}
class _TodoCardState extends State<TodoCard> {

  final bool _isChecked=false;
  @override
  Widget build(BuildContext context) {
    return Card(
    child: ListTile(
      leading: IconButton(onPressed: () {  },
          icon: Icon(_isChecked?
          Icons.check_box_outline_blank_rounded:
          Icons.check_box
          )),
      title: Text(
        widget.title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: PopupMenuButton<_MenuItems>(
        itemBuilder: (BuildContext context) => [
          const PopupMenuItem<_MenuItems>(
            value: _MenuItems.update,
            child: ListTile(
              leading: Icon(Icons.edit),
              title: Text("Edit"),
            ),
          ),
          const PopupMenuItem<_MenuItems>(
            value: _MenuItems.delete,
            child:  ListTile(
              leading: Icon(Icons.delete),
              title: Text("Delete"),
            ),
          ),
        ],
      ),
      ),
    );
  }
}
