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

  static Future<List<Task>> getAllTasksFromFirestore() async {
    final CollectionReference<Task> tasksCollection = getTasksCollection();
    final QuerySnapshot<Task> querySnapShot = await tasksCollection.get();
    return querySnapShot.docs.map((snapShot) => snapShot.data()).toList();
  }

  static void deleteTaskFromFirestore(String taskid) {}

  static Future<void> editIsDone(Task task) async {
    print('------------------');
    final CollectionReference<Task> tasksCollection = getTasksCollection();
    return tasksCollection.doc(task.id).update({"isDone": task.isDone});
  }
}
