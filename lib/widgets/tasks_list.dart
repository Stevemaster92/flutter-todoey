import 'package:flutter/material.dart';
import 'package:flutter_todoey/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  final List<TaskTile> tasks = [
    TaskTile(title: "Task 1"),
    TaskTile(title: "Task 2"),
    TaskTile(title: "Task 3"),
  ];

  TasksList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: tasks,
    );
  }
}
