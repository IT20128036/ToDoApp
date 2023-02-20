import 'package:flutter/material.dart';
import 'package:todoapp_yt/constants/colors.dart';
import 'package:todoapp_yt/widgets/todo_items.dart';

import '../models/todo.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final tasks = ToDo.todoList();
  final _todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgLightBlue,
        appBar: _appBarWidget(),
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 20.0,
              ),
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Text(
                        "To Do List",
                        style: TextStyle(
                          color: bgBlack,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: tasks.length,
                      itemBuilder: (context, index) => ToDoItem(
                            todo: tasks[index],
                            onChangeItem: _onChangeItem,
                            // onChangeItem: (todo) {
                            //   setState(() {
                            //     tasks[index].isDone = todo.isDone == 1 ? 0 : 1;
                            //   });
                            // },
                            onDeleteItem: _onDeleteItem,
                            // onDeleteItem: (id) {
                            //   setState(() {
                            //     tasks.removeAt(index);
                            //   });
                            // },
                          ))
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(
                      left: 20,
                      right: 10,
                      bottom: 20,
                    ),
                    decoration: BoxDecoration(
                      color: bgWhite,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child:  TextField(
                      controller: _todoController,
                      decoration: const InputDecoration(
                        hintText: "Add new task",
                        hintStyle: TextStyle(
                          color: bgBlack,
                          fontSize: 20,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 20,
                        ),
                      ),
                    ),
                  ),
                ),





                Container(
                  margin: const EdgeInsets.only(
                    left: 10,
                    right: 20,
                    bottom: 20,
                  ),
                  decoration: BoxDecoration(
                    color: bgBlue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: IconButton(
                    onPressed: () {
                      _onAddItem(_todoController.text);

                    },
                    icon: const Icon(
                      Icons.add,
                      color: bgWhite,
                    ),
                  ),
                ),
              ]),
            
            )

          ],
        ));
  }

  AppBar _appBarWidget() {
    return AppBar(
      backgroundColor: bgBlue,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text("To Do App",
              style: TextStyle(
                color: bgWhite,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
          Icon(
            Icons.menu,
            color: bgWhite,
            size: 30,
          ),
        ],
      ),
    );
  }

  void _onChangeItem(ToDo todo) {
    setState(() {
      if (todo.isDone == 1) {
        todo.isDone = 0;
      } else {
        todo.isDone = 1;
      }
    });
  }

  void _onDeleteItem(String id) {
    setState(() {
      tasks.removeWhere((element) => element.id == id);
    });
  }



void _onAddItem(String title) {



  if(title.isNotEmpty){
    setState(() {
      tasks.add(ToDo(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        title: title,
        isDone: 0,
      ));
    });
    _todoController.clear();

  }else{
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Please enter a task"),
      ),
    );
  }





  
  }




}
