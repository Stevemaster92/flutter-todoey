import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter_todoey/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: "Buy milk"),
    Task(name: "Buy eggs"),
    Task(name: "Buy bread"),
    Task(name: "Go to the gym"),
  ];

  int get taskCount => _tasks.length;

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  int get tasksLeft => _tasks.where((element) => !element.isDone).length;

  void addTask(String title) {
    _tasks.add(Task(name: title));
    notifyListeners();
  }

  void toggleTask(int index) {
    _tasks[index].toggleDone();
    notifyListeners();
  }
}
