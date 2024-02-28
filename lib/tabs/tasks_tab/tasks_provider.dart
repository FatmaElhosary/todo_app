import 'package:flutter/material.dart';
import 'package:todo_app/firebase_utils.dart';
import 'package:todo_app/models/task.dart';

class TasksProvider with ChangeNotifier {
  List<Task> tasks = [];
  DateTime selectedDate = DateTime.now();
  TasksProvider() {
    getTasks();
  }
  Future<void> getTasks() async {
    final allTasks = await FirebaseUtils.getAllTasksFromFirestore();
    tasks = allTasks
        .where((task) =>
            task.dateTime.day == selectedDate.day &&
            task.dateTime.month == selectedDate.month &&
            task.dateTime.year == selectedDate.year)
        .toList();
    tasks.sort((task, nextTask) => task.dateTime.compareTo(nextTask.dateTime));
    notifyListeners();
  }

  void changeSelectedDate(DateTime newDate) {
    selectedDate = newDate;
    getTasks();
  }

  
}
