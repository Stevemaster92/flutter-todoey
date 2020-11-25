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
          final task = taskData.tasks[index];

          return TaskTile(
            title: task.name,
            isChecked: task.isDone,
            onChecked: (value) => taskData.toggle(task),
            onDeleted: () => taskData.delete(task),
          );
        },
        itemCount: taskData.taskCount,
      ),
    );
  }
}
