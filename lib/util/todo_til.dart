// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  // Text : String
  final String taskName;
  // checkbox: value : true or false
  final bool taskCompleted;
  // checkbox: onChanged  : meythod changes the state of check box to true o false
  Function(bool?)? onChanged;

  // Custom Widget
   ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Row(
            children: [
              //checkbox
              Checkbox(value: taskCompleted, onChanged: onChanged),
              // task name
              Text(taskName),
            ],
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
