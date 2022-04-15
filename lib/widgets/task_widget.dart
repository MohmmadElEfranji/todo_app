import 'package:flutter/material.dart';
import 'package:todo_app/models/task_model.dart';

class TaskWidget extends StatefulWidget {
  Function fun;
  Task task;

  TaskWidget(this.task,this.fun);

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

      return buildContainer();

  }

  Container buildContainer() {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: widget.task.isCompleted ? Colors.green : Colors.black45,
          borderRadius: BorderRadius.circular(15)),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      child: CheckboxListTile(
        title: Text(widget.task.title),
        value: widget.task.isCompleted,
        onChanged: (v) {
          widget.fun(widget.task);
        },
      ),
    );
  }

}
