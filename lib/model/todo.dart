class ToDo {
  String id;
  String todoText;
  bool isDone;
  ToDo({required this.id, required this.todoText, this.isDone = false});

  static List<ToDo> todoList = [
    ToDo(id: "1", todoText: "do homework", isDone: true),
    ToDo(id: "2", todoText: "study english", isDone: true),
    ToDo(
      id: "3",
      todoText: "check email",
    ),
    ToDo(
      id: "4",
      todoText: "solve problem solving",
    ),
    ToDo(id: "5", todoText: "read a book", isDone: true),
    ToDo(
      id: "6",
      todoText: "listen to music",
    ),
    ToDo(id: "7", todoText: "finish course", isDone: true),
  ];
}
