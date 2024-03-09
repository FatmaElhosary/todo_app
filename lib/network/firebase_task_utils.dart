import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:todo_app/models/task.dart';
import 'package:todo_app/network/firebase_auth.dart';

class FirebaseUtils {
  static CollectionReference<Task> getTasksCollection(String userId) =>
      Auth.getUsersCollection()
          .doc(userId)
          .collection('tasks')
          .withConverter<Task>(
            fromFirestore: (snapshot, options) =>
                Task.fromJson(snapshot.data()!),
            toFirestore: (task, options) => task.toJson(),
          );

  static Future<void> addTaskToFirestore(String userId, Task task) {
    final CollectionReference<Task> tasksCollection =
        getTasksCollection(userId);
    final DocumentReference<Task> doc = tasksCollection.doc();
    task.id = doc.id;
    return doc.set(task);
  }

  static Future<List<Task>> getTasksByDateFromFirestore(
      Timestamp startDay, Timestamp endDay, String userId) async {
    final CollectionReference<Task> tasksCollection =
        getTasksCollection(userId);
    final QuerySnapshot<Task> querySnapShot = await tasksCollection
        .where('dateTime', isGreaterThanOrEqualTo: startDay)
        .where('dateTime', isLessThanOrEqualTo: endDay)
        .orderBy('dateTime', descending: true)
        .get();
    return querySnapShot.docs.map((snapShot) => snapShot.data()).toList();
  }

  static Future<void> deleteTaskFromFirestore(String userId, String taskid) {
    final CollectionReference<Task> tasksCollection =
        getTasksCollection(userId);
    return tasksCollection.doc(taskid).delete();
  }

  static Future<void> editTaskInFireStore(String userId, Task task) async {
    final CollectionReference<Task> tasksCollection =
        getTasksCollection(userId);
    return tasksCollection.doc(task.id).update(task.toJson());
  }
}
