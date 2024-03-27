import 'package:flutter/material.dart';
import 'package:todo_list/model/todo.dart';

import '../widgets/item.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ToDo> foundToDo = [];
  final todolist = ToDo.todoList;
  final todoController = TextEditingController();
  final searchboxController = TextEditingController();

  void initState() {
    foundToDo = todolist;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(250, 254, 215, 255),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(250, 254, 215, 255),
          elevation: 0,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.menu,
                color: Colors.black,
              ),
              Container(
                height: 50,
                width: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    'assets/cat.jpeg',
                  ),
                ),
              )
            ],
          ),
        ),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 40,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextField(
                        onChanged: (value) => runFilter(value),
                        controller: searchboxController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(0),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.black,
                            size: 20,
                          ),
                          prefixIconConstraints: BoxConstraints(
                            maxHeight: 20,
                            minWidth: 20,
                          ),
                          border: InputBorder.none,
                          hintText: 'Search',
                          // hintStyle: TextStyle()
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        Container(
                          margin:
                              EdgeInsets.only(top: 50, bottom: 30, left: 16),
                          child: Text(
                            "All ToDos",
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        for (ToDo toDoo in foundToDo.reversed)
                          ToDoItem(
                              toDo: toDoo,
                              onChangeToDo: handleToDo,
                              onDeleteItem: deleteToDo),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(
                        bottom: 20,
                        right: 20,
                        left: 20,
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 10.0,
                            spreadRadius: 0.0,
                          )
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: todoController,
                        decoration: const InputDecoration(
                          hintText: 'Add a new todo item',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20, right: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        final newTask = todoController.text;
                        if (newTask.trim().isNotEmpty) {
                          addToDoItem(todoController.text);
                        }
                      },
                      child: Text(
                        "+",
                        style: TextStyle(fontSize: 40),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 147, 19, 126),
                        minimumSize: Size(60, 60),
                        elevation: 10,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }

  void handleToDo(ToDo toDo) {
    setState(() {
      toDo.isDone = !toDo.isDone;
    });
  }

  void deleteToDo(String id) {
    setState(() {
      todolist.removeWhere((element) => element.id == id);
    });
  }

  void addToDoItem(String toDo) {
    setState(() {
      todolist.add(ToDo(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          todoText: toDo));
    });
    todoController.clear();
  }

  void runFilter(String keyword) {
    List<ToDo> results = [];
    if (keyword.isEmpty) {
      results = todolist;
    } else {
      results = todolist
          .where((element) =>
              element.todoText.toLowerCase().contains(keyword.toLowerCase()))
          .toList();
    }
    setState(() {
      foundToDo = results;
    });
  }
}
