import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app_theme.dart';
import 'package:todo_app/auth/home_or_login.dart';
import 'package:todo_app/auth/login_screen.dart';
import 'package:todo_app/auth/register_screen.dart';
import 'package:todo_app/providers/settings_provider.dart';
import 'package:todo_app/screens/edit_task.dart';
import 'package:todo_app/screens/home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_app/providers/tasks_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await Firebase.initializeApp().then((value) {
    debugPrint('firebase initialized');
  }).catchError((err) {
    debugPrint(err.toString());
  });

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => SettingsProvider()..initalizeSettings(),
    ),
    ChangeNotifierProvider(
      create: (context) => TasksProvider(),
    ),
  
  ], child: const TodoApp()));
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(
      context,
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo Demo',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: provider.appTheme,
      routes: {
        HomeOrLogin.routeName: (_) => const HomeOrLogin(),
        HomeScreen.routeName: (_) => const HomeScreen(),
        EditTask.routName: (context) => const EditTask(),
        LoginScreen.routeName: (_) => const LoginScreen(),
        RegisterScreen.routeName: (_) => const RegisterScreen(),
      },
      initialRoute: HomeOrLogin.routeName,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.appLanguage),
    );
  }
}
