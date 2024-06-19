// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:to_do_app/util/dialog_box.dart';
import 'package:to_do_app/util/todo_til.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // text controller
  final _controller = TextEditingController();

  // list of todo tasks
  List toDolIST = [
    ["Make Tutorial", false],
    ["Do Exercise", false],
  ];

  // checkbox was tapped
  void checkedChanged(bool? value, int index) {
    // setsate rebuilds widget
    setState(() {
      toDolIST[index][1] = !toDolIST[index][1];
    });
    print(toDolIST[index][1]);
  }

  // save new task
  void saveNewTask() {
    // add task to toDoList
    setState(() {
      toDolIST.add([_controller.text, false]);
      // clears TextField
      _controller.clear();
    });
    // Dismiss dialog box
    Navigator.of(context).pop();
  }

  // create new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Text("TO DO"),
        elevation: 0,
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(
          Icons.add,
        ),
      ),
      body: ListView.builder(
        itemCount: toDolIST.length,
        itemBuilder: ((context, index) {
          return ToDoTile(
            taskName: toDolIST[index][0],
            taskCompleted: toDolIST[index][1],
            onChanged: (value) => checkedChanged(value, index),
          );
        }),
      ),
    );
  }
}
