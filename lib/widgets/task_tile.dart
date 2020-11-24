import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String title;
  final bool isChecked;
  final Function onChecked;

  TaskTile({@required this.title, this.isChecked = false, @required this.onChecked});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(decoration: isChecked ? TextDecoration.lineThrough : TextDecoration.none),
      ),
      trailing: Checkbox(activeColor: Colors.lightBlueAccent, value: isChecked, onChanged: onChecked),
    );
  }
}
