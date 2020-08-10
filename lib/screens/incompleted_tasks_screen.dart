import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import '../providers/tasks_provider.dart';

class IncompletedTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Provider.of<TasksProvider>(context).getIncompletedTasks().length,
      itemBuilder: (BuildContext context, int index) {
        List<Task> allTasks = Provider.of<TasksProvider>(context).getIncompletedTasks();
        return ListTile(
          title: Text(allTasks[index].title),
          subtitle: Text(allTasks[index].description),
          trailing: Checkbox(
              value: allTasks[index].isCompleted,
              onChanged: (val) =>
                  Provider.of<TasksProvider>(context, listen: false)
                      .toggleIscompleted(allTasks[index])),
        );
      },
    );
  }
}