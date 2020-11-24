import 'package:flutter/material.dart';
import 'package:flutter_todoey/models/task.dart';
import 'package:flutter_todoey/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  final List<Task> items;
  final Function onChecked;

  TasksList({Key key, @required this.items, @required this.onChecked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          title: items[index].name,
          isChecked: items[index].isDone,
          onChecked: (value) => onChecked(index, value),
        );
      },
      itemCount: items.length,
    );
  }
}
