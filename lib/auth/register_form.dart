import 'package:flutter/material.dart';
import 'package:todo_app/screens/home_screen.dart';
import 'package:todo_app/shared/shared.dart';
import 'package:todo_app/widgets/elaveted_btn.dart';
import 'package:todo_app/widgets/text_form_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final userNameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    userNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    return Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 33),
          shrinkWrap: true,
          children: <Widget>[
            GlobalTextField(
              labelText: local.name,
              controller: userNameController,
              validator: (input) {
                if (input == null || input.isEmpty) {
                  return local.nameEmpty;
                }
                return null;
              },
            ),
            const SizedBox(
              height: 33,
            ),
            GlobalTextField(
              labelText: local.email,
              controller: emailController,
              validator: (input) {
                if (input == null || input.isEmpty) {
                  return local.emailEmpty;
                } else if (!isValidEmail(input)) {
                  return local.emailNotValid;
                }
                return null;
              },
            ),
            const SizedBox(
              height: 33,
            ),
            GlobalTextField(
              labelText: local.passwowrd,
              controller: passwordController,
              isPassword: true,
              validator: (input) {
                if (input == null || input.isEmpty) {
                  return local.passwordEmpty;
                } else if (input.length < 6) {
                  return local.passwordLength;
                }
                return null;
              },
            ),
            const SizedBox(
              height: 33,
            ),
            GlobalButton(
              text: local.register,
              onPressed: register,
            ),
          ],
        ));
  }

  void register() {
    if (formKey.currentState!.validate()) {
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    }
  }
}
