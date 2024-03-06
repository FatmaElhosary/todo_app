import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/firebase_utils.dart';
import 'package:todo_app/models/task.dart';

class TasksProvider with ChangeNotifier {
  late List<Task> tasks;
  late DateTime selectedDate;
  TasksProvider() {
    selectedDate = DateTime.now();
    tasks = [];
    getTasksBySelectedDate();
  }
  DateTime get currentDate => selectedDate;
  List<Task> get currentChoosenDateTasks => tasks;
  Future<void> getTasksBySelectedDate() async {
    // DateTime tasksDate = date ?? currentDate;
    //set start date
    final DateTime startOfDay =
        DateTime(currentDate.year, currentDate.month, currentDate.day);

// Set up end date
    final DateTime endOfDay = startOfDay.add(const Duration(days: 1));
    tasks = await FirebaseUtils.getTasksByDateFromFirestore(
        Timestamp.fromDate(startOfDay), Timestamp.fromDate(endOfDay));
    print(tasks);
    notifyListeners();
  }

  void changeSelectedDate(DateTime newDate) {
    selectedDate = newDate;
    getTasksBySelectedDate();
    //  notifyListeners();
  }
}
    /*  tasks = allTasks
        .where((task) =>
            task.dateTime.day == selectedDate.day &&
            task.dateTime.month == selectedDate.month &&
            task.dateTime.year == selectedDate.year)
        .toList(); */
    //tasks.sort((task, nextTask) => task.dateTime.compareTo(nextTask.dateTime));

        /*  currentDate.copyWith(
        hour: 0, minute: 0, second: 0, millisecond: 0, microsecond: 0); */