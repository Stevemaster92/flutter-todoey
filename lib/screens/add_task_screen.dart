import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  final Function onTaskAdded;

  AddTaskScreen({@required this.onTaskAdded});

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
                onTaskAdded(taskTitle);
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
