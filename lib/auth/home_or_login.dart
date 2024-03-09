import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/auth/login_screen.dart';
import 'package:todo_app/screens/home_screen.dart';

class HomeOrLogin extends StatefulWidget {
  static const routeName = 'HomeOrLogin';
  const HomeOrLogin({super.key});

  @override
  State<HomeOrLogin> createState() => _HomeOrLoginState();
}

class _HomeOrLoginState extends State<HomeOrLogin> {
  var userDate = FirebaseAuth.instance.authStateChanges();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: userDate,

        ///initialData: FirebaseAuth.instance.currentUser,
        builder: (context, snapshot) {
          // Check if user is logged in
          try {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              // An error occurred, handle the error case
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              User? user = snapshot.data;
              if (user == null) {
                return const LoginScreen();
              }
              return const HomeScreen();
            } else {
              return const LoginScreen();
              /*  return const Scaffold(
                body: Center(child: CircularProgressIndicator())); */
            }
          } catch (error) {
            // Handle the error case
            print('errorrrrr');
            return Text('Error: $error');
          }
        },
      ),
    );
  }
}
