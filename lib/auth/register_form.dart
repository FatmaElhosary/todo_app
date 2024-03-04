import 'package:flutter/material.dart';
import 'package:todo_app/widgets/elaveted_btn.dart';
import 'package:todo_app/widgets/text_form_field.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final userNameController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    userNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        child: ListView(
      padding: const EdgeInsets.symmetric(vertical: 33),
      shrinkWrap: true,
      children: <Widget>[
        GlobalTextField(
            labelText: 'First name', controller: userNameController),
        const SizedBox(
          height: 33,
        ),
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
          text: 'Create Account',
          onPressed: register,
        ),
      ],
    ));
  }

  void register() {}
}
