class ToDo {
  String id;
  String title;
  int isDone;

  ToDo({
    required this.id,
    required this.title,
    this.isDone = 0,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(
        id: "1",
        title: "Do Home Work",
        isDone: 1,
      ),
      ToDo(
        id: "2",
        title: "Clean Room",
        isDone: 0,
      ),
      ToDo(
        id: "3",
        title: "Attend To The Lecture",
        isDone: 0,
      ),
      ToDo(
        id: "4",
        title: "Play Games",
        isDone: 1,
      ),
      ToDo(
        id: "5",
        title: "Watch Movies",
        isDone: 0,
      )
    ];
  }
}
