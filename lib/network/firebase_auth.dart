import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/models/user_model.dart';

class Auth {
  static CollectionReference<UserModel> getUsersCollection() =>
      FirebaseFirestore.instance.collection('users').withConverter<UserModel>(
            fromFirestore: (snapshot, options) =>
                UserModel.fromJson(snapshot.data()!),
            toFirestore: (user, options) => user.toJson(),
          );

  static Future<UserModel> register(
      {required String email,
      required String password,
      required String userName}) async {
    final UserCredential crediential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    final user =
        UserModel(id: crediential.user!.uid, email: email, userName: userName);
    var userCollection = getUsersCollection();
    await userCollection.doc(user.id).set(user);
    return user;
  }

  static Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    final UserCredential crediential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    //  String userId = crediential.user!.uid;
    CollectionReference<UserModel> userCollection = getUsersCollection();
    final userSnapShot = await userCollection.doc(crediential.user!.uid).get();
    return userSnapShot.data()!;
  }

  static Future<void> logout() {
    return FirebaseAuth.instance.signOut();
  }

  static User? checkUserAuth() {
    User? currentUser;
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        currentUser = null;
      } else {
        currentUser = user;
      }
    });
   
    return currentUser;
  }
}
