import 'package:flutter/material.dart';
import 'package:todo_app/auth/login_form.dart';
import 'package:todo_app/auth/register_screen.dart';
import 'package:todo_app/widgets/text_button.dart';
import 'package:todo_app/widgets/title_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = 'login';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(local.login),
        centerTitle: true,
        titleTextStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
        backgroundColor: Colors.transparent,
        toolbarHeight: 120,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/images/auth_background.png',
                ),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(
              flex: 2,
            ),
            TitleWidget(
              text: local.welcomeback,
            ),
            const LoginForm(),
            GlobalTextButton(
              text: local.createAccount,
              onPressed: () => Navigator.pushReplacementNamed(
                  context, RegisterScreen.routeName),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
