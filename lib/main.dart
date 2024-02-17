import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app_theme.dart';
import 'package:todo_app/providers/settings_provider.dart';
import 'package:todo_app/screens/home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_app/tabs/settings_tab/settings_tab.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => SettingsProvider()..initalizeSettings(), child: const TodoApp()));
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsProvider>(
        builder: (context, provier, Widget? child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Todo Demo',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: provier.appTheme,
        /*  routes: {
          HomeScreen.routeName: (_) => const HomeScreen(),
        }, */
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: Locale(provier.appLanguage),
        home: SettingsTab(),
      );
    });
  }
}
