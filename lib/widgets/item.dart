import 'package:flutter/material.dart';
import 'package:todo_list/model/todo.dart';

class ToDoItem extends StatelessWidget {
  const ToDoItem(
      {super.key,
      required this.toDo,
      required this.onChangeToDo,
      required this.onDeleteItem});
  final ToDo toDo;
  final onChangeToDo;
  final onDeleteItem;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        child: ListTile(
          onTap: () {
            onChangeToDo(toDo);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          tileColor: Colors.white,
          leading: toDo.isDone
              ? Icon(
                  Icons.check_box,
                  color: Colors.blue,
                )
              : Icon(
                  Icons.check_box_outline_blank,
                ),
          title: Text(
            "${toDo.todoText}",
            style: TextStyle(
              fontSize: 16,
              decoration: toDo.isDone ? TextDecoration.lineThrough : null,
            ),
          ),
          trailing: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 120, 180, 122),
              borderRadius: BorderRadius.circular(5),
            ),
            child: IconButton(
              onPressed: () {
                onDeleteItem(toDo.id);
              },
              icon: Icon(
                Icons.delete,
                color: Colors.white,
                size: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
