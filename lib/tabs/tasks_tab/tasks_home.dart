import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/tabs/tasks_tab/task_widget.dart';
import 'package:todo_app/tabs/tasks_tab/tasks_calender.dart';

class TasksHome extends StatelessWidget {
  const TasksHome({super.key});

  @override
  Widget build(BuildContext context) {
    List<Task> tasks = [
      Task(title: 'task1', description: 'des1'),
      Task(title: 'task2', description: 'des2'),
      Task(title: 'task3', description: 'des3'),
      Task(title: 'task1', description: 'des1'),
      Task(title: 'task2', description: 'des2'),
      Task(title: 'task3', description: 'des3')
    ];
    return Column(
      children: [
        const TasksCalender(),
        Expanded(
            child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 15),
          itemBuilder: (context, index) => TaskWidget(task: tasks[index]),
          itemCount: tasks.length,
        )),
      ],
    );
  }
}
