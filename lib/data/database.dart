import 'package:hive/hive.dart';

class ToDoDatabase {
  // list of todo tasks
  List toDolIST = [];

  // reference our box
  final _myBox = Hive.box("mybox");

  // run this method if this is the first time ever opening this app
  void createInitialData() {
    toDolIST = [
      ["Make Tutorial", false],
      ["Do Exercise", false],
    ];
  }

  // load the data from database
  void loadData() {
    toDolIST = _myBox.get("TODOLIST");
  }

  // update the database
  void updateDatabase() {
    _myBox.put("TODOLIST", toDolIST);
  }
}
