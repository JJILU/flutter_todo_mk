// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:to_do_app/util/todo_til.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Text("TO DO"),
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ToDoTile(taskName: "Bake Chocolate Cookies",taskCompleted: false, onChanged: (p0) {} ,),
          ToDoTile(taskName: "Buy milks and apples", taskCompleted: true, onChanged: (p0) {},),
          ToDoTile(taskName: "Read Novel", taskCompleted: false, onChanged: (p0) {},),
          ToDoTile(taskName: "Watch 12pm News",taskCompleted: true, onChanged: (p0) {},),
        ],
      ),
    );
  }
}