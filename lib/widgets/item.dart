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
                  color: Color.fromARGB(255, 197, 29, 209),
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
              color: const Color.fromARGB(255, 239, 26, 11),
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
