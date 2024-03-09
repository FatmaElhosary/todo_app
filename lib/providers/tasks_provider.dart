import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/network/firebase_task_utils.dart';
import 'package:todo_app/models/task.dart';

class TasksProvider with ChangeNotifier {
  List<Task> tasks = [];
  DateTime selectedDate = DateTime.now();

  DateTime get currentDate => selectedDate;
  List<Task> get currentChoosenDateTasks => tasks;
  Future<void> getTasksBySelectedDate(String userId) async {
    // DateTime tasksDate = date ?? currentDate;
    //set start date
    final DateTime startOfDay =
        DateTime(currentDate.year, currentDate.month, currentDate.day);

// Set up end date
    final DateTime endOfDay = startOfDay.add(const Duration(days: 1));
    tasks = await FirebaseUtils.getTasksByDateFromFirestore(
        Timestamp.fromDate(startOfDay), Timestamp.fromDate(endOfDay), userId);
    print(tasks);
    notifyListeners();
  }

  void changeSelectedDate(String userId, DateTime newDate) {
    selectedDate = newDate;
    getTasksBySelectedDate(userId);
    //  notifyListeners();
  }

  void clear() {
    selectedDate = DateTime.now();
    tasks = [];
  }
}
