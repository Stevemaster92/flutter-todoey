import 'package:flutter/material.dart';
import 'package:flutter_todoey/models/task_data.dart';
import 'package:flutter_todoey/widgets/task_tile.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) => ListView.builder(
        itemBuilder: (context, index) {
          return TaskTile(
            title: taskData.tasks[index].name,
            isChecked: taskData.tasks[index].isDone,
            onChecked: (value) => taskData.toggleTask(index),
          );
        },
        itemCount: taskData.taskCount,
      ),
    );
  }
}
