import 'package:flutter/material.dart';
import 'package:todo_app/data/tasks_data.dart';

class AllTasksScreen extends StatefulWidget {
  Function fun;

  AllTasksScreen(this.fun);

  @override
  State<AllTasksScreen> createState() => _AllTasksScreenState();
}

class _AllTasksScreenState extends State<AllTasksScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return buildScaffold();
  }

  Scaffold buildScaffold() {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
                itemCount: tasksList.length,
                itemBuilder: (_, int index) {
                  return Card(
                    color: tasksList[index].isCompleted
                        ? Colors.green
                        : Colors.black45,
                    child: CheckboxListTile(
                      title: Text(tasksList[index].title),
                      value: tasksList[index].isCompleted,
                      secondary: ElevatedButton.icon(
                          icon: const Icon(
                            // <-- Icon
                            Icons.remove_circle,
                            size: 24.0,
                          ),
                          onPressed: () {
                            deleteItem(index);
                          },
                          label: const Text(
                            'Remove',
                            style: TextStyle(fontSize: 12),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                          )),
                      onChanged: (value) {
                        tasksList[index].isCompleted =
                            !tasksList[index].isCompleted;
                        setState(() {});
                      },
                    ),
                  );
                }),
          ),
          const Divider(
            height: 1.0,
          )
        ],
      ),
    );
  }

  deleteItem(int index) {
    setState(() {
      tasksList.removeAt(index);
    });
  }
}
