import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/tabs/tasks_tab/task_widget.dart';
import 'package:todo_app/tabs/tasks_tab/tasks_calender.dart';
import 'package:todo_app/tabs/tasks_tab/tasks_provider.dart';

class TasksHome extends StatelessWidget {
  const TasksHome({super.key});

  @override
  Widget build(BuildContext context) {
    var tasksProvider = Provider.of<TasksProvider>(context);

    return Column(
      children: [
        const TasksCalender(),
        Expanded(
            child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 15),
          itemBuilder: (context, index) =>
              TaskWidget(task: tasksProvider.tasks[index]),
          itemCount: tasksProvider.tasks.length,
        )),
      ],
    );
  }
}
