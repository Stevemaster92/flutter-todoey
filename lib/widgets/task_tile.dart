import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String title;
  final bool isChecked;
  final Function onChecked, onDeleted;

  TaskTile({@required this.title, this.isChecked = false, @required this.onChecked, this.onDeleted});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: onDeleted,
      title: Text(
        title,
        style: TextStyle(decoration: isChecked ? TextDecoration.lineThrough : TextDecoration.none),
      ),
      leading: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: onChecked,
      ),
      trailing: FlatButton.icon(
        onPressed: onDeleted,
        icon: Icon(Icons.delete, color: Colors.red),
        label: Text(""),
      ),
    );
  }
}
