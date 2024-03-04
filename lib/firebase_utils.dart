import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/models/task.dart';

class FirebaseUtils {
  static CollectionReference<Task> getTasksCollection() =>
      FirebaseFirestore.instance.collection('tasks').withConverter<Task>(
            fromFirestore: (snapshot, options) =>
                Task.fromJson(snapshot.data()!),
            toFirestore: (task, options) => task.toJson(),
          );

  static Future<void> addTaskToFirestore(Task task) {
    final CollectionReference<Task> collection = getTasksCollection();
    final DocumentReference<Task> doc = collection.doc();
    task.id = doc.id;
    return doc.set(task);
  }

  static Future<List<Task>> getTasksByDateFromFirestore(
      Timestamp startDay, Timestamp endDay) async {
    final CollectionReference<Task> tasksCollection = getTasksCollection();
    final QuerySnapshot<Task> querySnapShot = await tasksCollection
        .where('dateTime', isGreaterThanOrEqualTo: startDay)
        .where('dateTime', isLessThanOrEqualTo: endDay)
        .orderBy('dateTime')
        .get();
    return querySnapShot.docs.map((snapShot) => snapShot.data()).toList();
  }

  static Future<void> deleteTaskFromFirestore(String taskid) {
    final CollectionReference<Task> tasksCollection = getTasksCollection();
    return tasksCollection.doc(taskid).delete();
  }

  static Future<void> editTaskInFireStore(Task task) async {
    final CollectionReference<Task> tasksCollection = getTasksCollection();
    return tasksCollection.doc(task.id).update(task.toJson());
  }
}
