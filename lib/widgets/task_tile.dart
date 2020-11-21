import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  final String title;
  final bool isDone;

  TaskTile({
    Key key,
    @required this.title,
    this.isDone = false,
  }) : super(key: key);

  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool isChecked;

  @override
  void initState() {
    super.initState();

    isChecked = widget.isDone;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.title,
        style: TextStyle(decoration: isChecked ? TextDecoration.lineThrough : TextDecoration.none),
      ),
      trailing: Checkbox(
        value: isChecked,
        onChanged: (value) {
          setState(() {
            isChecked = value;
            // TODO: Set task to done/undone.
          });
        },
      ),
    );
  }
}
