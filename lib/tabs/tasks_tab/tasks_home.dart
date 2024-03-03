import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/tabs/tasks_tab/task_widget.dart';
import 'package:todo_app/tabs/tasks_tab/tasks_calender.dart';
import 'package:todo_app/providers/tasks_provider.dart';

class TasksHome extends StatefulWidget {
  const TasksHome({super.key});

  @override
  State<TasksHome> createState() => _TasksHomeState();
}

class _TasksHomeState extends State<TasksHome> {
  @override
  Widget build(BuildContext context) {
    final tasksProvider = Provider.of<TasksProvider>(context);

    return Column(
      children: [
        const TasksCalender(),
        Expanded(
            child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 15),
          itemBuilder: (context, index) =>
              TaskWidget(task: tasksProvider.currentChoosenDateTasks[index]),
          itemCount: tasksProvider.currentChoosenDateTasks.length,
        )),
      ],
    );
  }
}
