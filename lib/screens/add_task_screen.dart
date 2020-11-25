import 'package:flutter/material.dart';
import 'package:flutter_todoey/models/task_data.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String taskTitle;

    return Container(
      color: Color(0xff757575),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
        ),
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Add Task",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24.0, color: Colors.lightBlueAccent),
            ),
            SizedBox(height: 20.0),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (value) => taskTitle = value,
            ),
            SizedBox(height: 10.0),
            FlatButton(
              onPressed: () {
                if (taskTitle != null) {
                  Provider.of<TaskData>(context, listen: false).add(taskTitle);
                }
                Navigator.pop(context);
              },
              child: Text("ADD", style: TextStyle(color: Colors.white)),
              color: Colors.lightBlueAccent,
            )
          ],
        ),
      ),
    );
  }
}
