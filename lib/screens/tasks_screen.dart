import 'package:flutter/material.dart';
import 'package:flutter_todoey/models/task.dart';
import 'package:flutter_todoey/screens/add_task_screen.dart';
import 'package:flutter_todoey/widgets/tasks_list.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  List<Task> tasks = [
    Task(name: "Buy milk"),
    Task(name: "Buy eggs"),
    Task(name: "Buy bread"),
  ];
  num numberOfTasksLeft;

  @override
  void initState() {
    super.initState();

    numberOfTasksLeft = tasks.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add),
        onPressed: () => showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) => SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              child: AddTaskScreen(
                onTaskAdded: (title) => setState(() {
                  tasks.add(Task(name: title));
                  numberOfTasksLeft++;
                }),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 60.0, right: 30.0, bottom: 30.0, left: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  child: Icon(Icons.list, size: 40.0, color: Colors.lightBlueAccent),
                  backgroundColor: Colors.white,
                  radius: 30.0,
                ),
                SizedBox(height: 10.0),
                Text(
                  "Todoey",
                  style: TextStyle(color: Colors.white, fontSize: 40.0, fontWeight: FontWeight.w700),
                ),
                Text(
                  "$numberOfTasksLeft tasks left",
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
                SizedBox(height: 20.0),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
              ),
              child: TasksList(
                items: tasks,
                onChecked: (index, value) {
                  setState(() {
                    tasks[index].toggleDone();
                    numberOfTasksLeft -= value ? 1 : -1;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
