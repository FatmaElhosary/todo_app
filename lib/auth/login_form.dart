import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/network/firebase_auth.dart';
import 'package:todo_app/screens/home_screen.dart';
import 'package:todo_app/shared/shared.dart';
import 'package:todo_app/widgets/elaveted_btn.dart';
import 'package:todo_app/widgets/text_form_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
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
              text: local.login,
              onPressed: login,
            ),
          ],
        ));
  }

  void login() {
    if (formKey.currentState!.validate()) {
      Auth.login(
        email: emailController.text,
        password: passwordController.text,
      ).then((user) {
       // Provider.of<UserProvider>(context,listen: false).updateCurrentUser(user);
        Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
      }).catchError((err) {
        if (err is FirebaseAuthException && err.message != null) {
          ScaffoldMessenger.of(context).showSnackBar(getSnackbar(err.message!));
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(getSnackbar(err.toString()));
        }
      });
    }
  }
}
