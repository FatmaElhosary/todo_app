import 'package:flutter/material.dart';
import 'package:todo_app/screens/home_screen.dart';
import 'package:todo_app/widgets/elaveted_btn.dart';
import 'package:todo_app/widgets/text_form_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        child: ListView(
      padding: const EdgeInsets.symmetric(vertical: 33),
      shrinkWrap: true,
      children: <Widget>[
        GlobalTextField(labelText: 'Email', controller: emailController),
        const SizedBox(
          height: 33,
        ),
        GlobalTextField(
          labelText: 'Password',
          controller: passwordController,
          isPassword: true,
        ),
        const SizedBox(
          height: 33,
        ),
        GlobalButton(
          text: 'Login',
          onPressed: login,
        ),
      ],
    ));
  }

  void login() {
    Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
  }
}
