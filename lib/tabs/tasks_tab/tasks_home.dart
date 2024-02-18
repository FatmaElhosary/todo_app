import 'package:flutter/material.dart';
import 'package:todo_app/tabs/tasks_tab/tasks_calender.dart';

class TasksHome extends StatelessWidget {
  const TasksHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TasksCalender(),
        
      ],
    );
  }
}