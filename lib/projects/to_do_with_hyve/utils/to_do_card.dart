import 'package:flutter/material.dart';

class ToDoCard extends StatelessWidget {
  const ToDoCard(
      {super.key,
      required this.name,
      required this.isTaskCompleted,
      required this.onTapOfTask});
  final String name;
  final bool isTaskCompleted;
  final Function() onTapOfTask;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.yellow.shade200,
      child: ListTile(
        title: Text(
          name,
          style: TextStyle(
              decoration: isTaskCompleted ? TextDecoration.lineThrough : null),
        ),
        leading: Checkbox(
          value: isTaskCompleted,
          onChanged: (value) => onTapOfTask(),
          activeColor: Colors.black,
        ),
      ),
    );
  }
}
