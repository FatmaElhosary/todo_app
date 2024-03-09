import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/tabs/tasks_tab/task_widget.dart';
import 'package:todo_app/providers/tasks_provider.dart';
import 'package:todo_app/widgets/easy_calender.dart';

class TasksHome extends StatefulWidget {
  const TasksHome({super.key});
  @override
  State<TasksHome> createState() => _TasksHomeState();
}

class _TasksHomeState extends State<TasksHome> {
  bool shouldGetTasks = true;
  late TasksProvider tasksProvider;
  @override
  Widget build(BuildContext context) {
    if (shouldGetTasks) {
      // Provider.of<UserProvider>(context).currentUser!.id
      tasksProvider = Provider.of<TasksProvider>(context)
        ..getTasksBySelectedDate(FirebaseAuth.instance.currentUser!.uid);
      shouldGetTasks = false;
    }

    return Column(
      children: [
        const EasyCalender(),
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
