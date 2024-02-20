import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/tabs/tasks_tab/task_widget.dart';
import 'package:todo_app/tabs/tasks_tab/tasks_calender.dart';

class TasksHome extends StatelessWidget {
  const TasksHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TasksCalender(),
        Expanded(
            child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 15),
          itemBuilder: (context, index) => const TaskWidget(),
          itemCount: 5,
        )),
      ],
    );
  }
}
