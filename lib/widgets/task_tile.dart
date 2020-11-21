import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  final String title;

  TaskTile({
    Key key,
    @required this.title,
  }) : super(key: key);

  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool done = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.title),
      trailing: Checkbox(
        value: done,
        onChanged: (value) {
          setState(() {
            done = value;
          });
        },
      ),
    );
  }
}
