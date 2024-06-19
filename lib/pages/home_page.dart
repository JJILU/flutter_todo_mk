// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app/data/database.dart';
import 'package:to_do_app/util/dialog_box.dart';
import 'package:to_do_app/util/todo_til.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
// reference the hive box
  final _myBox = Hive.box("mybox");

// create instance of our database
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    // if this is the first time ever opening the app then create default data
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      // there already exists data
      db.loadData();
    }
    super.initState();
  }

  // text controller
  final _controller = TextEditingController();

  // // list of todo tasks
  // List toDolIST = [
  //   ["Make Tutorial", false],
  //   ["Do Exercise", false],
  // ];

  // checkbox was tapped
  void checkedChanged(bool? value, int index) {
    // setsate rebuilds widget
    setState(() {
      db.toDolIST[index][1] = !db.toDolIST[index][1];
    });
    // update database
    db.updateDatabase();
    print(db.toDolIST[index][1]);
  }

  // save new task
  void saveNewTask() {
    // add task to toDoList
    setState(() {
      db.toDolIST.add([_controller.text, false]);
      // clears TextField
      _controller.clear();
    });
    // Dismiss dialog box
    Navigator.of(context).pop();
    // update database
    db.updateDatabase();
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

  // delete task
  void deleteTask(int index) {
    setState(() {
      db.toDolIST.removeAt(index);
    });
    // update database
    db.updateDatabase();
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
        itemCount: db.toDolIST.length,
        itemBuilder: ((context, index) {
          return ToDoTile(
            taskName: db.toDolIST[index][0],
            taskCompleted: db.toDolIST[index][1],
            onChanged: (value) => checkedChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        }),
      ),
    );
  }
}
