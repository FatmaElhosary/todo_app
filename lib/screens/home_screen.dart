import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_app/screens/add_task.dart';
import 'package:todo_app/tabs/settings_tab/settings_tab.dart';
import 'package:todo_app/tabs/tasks_tab/tasks_home.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 0;
  @override
  void initState() {
    currentPageIndex = 0;
    super.initState();
  }
/* 
  final List<Widget> destinationWidgets = [
    const TasksHome(),
    const SettingsTab()
  ]; */

  @override
  Widget build(BuildContext context) {
    final AppLocalizations appLocal = AppLocalizations.of(context)!;
    final ThemeData theme = Theme.of(context);
    final List<String> appBarTiTles = [appLocal.todo, appLocal.settings];

    void onItemTapped(int index) {
      setState(() {
        currentPageIndex = index;
      });
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        title: Text(appBarTiTles[currentPageIndex]),
        titleSpacing: MediaQuery.of(context).size.width * .12,
        titleTextStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
        backgroundColor: theme.colorScheme.primary,
        elevation: 0,
        toolbarHeight: MediaQuery.of(context).size.height * .15,
      ),
      body: currentPageIndex == 0 ? const TasksHome() : const SettingsTab(),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          backgroundColor: theme.colorScheme.primaryContainer,
          iconTheme: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return const IconThemeData(
                color: Color(0xFF5D9CEC), // Default color
                // Default size
              );
            }
            return const IconThemeData(
              color: Color(0xFFC8C9CB), // Default color
            );
          }),
        ),
        child: BottomAppBar(
          elevation: 0,
          notchMargin: 10,
          padding: EdgeInsets.zero,
          shape: const CircularNotchedRectangle(),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: NavigationBar(
            onDestinationSelected: onItemTapped,
            selectedIndex: currentPageIndex,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            backgroundColor: theme.colorScheme.primaryContainer,
            surfaceTintColor: Colors.transparent,
            indicatorColor: Colors.transparent,
            overlayColor: MaterialStatePropertyAll(theme.colorScheme.primary),
            destinations: const [
              NavigationDestination(
                icon: ImageIcon(AssetImage('assets/images/tasks_icon.png')),
                label: 'tasks',
              ),
              NavigationDestination(
                icon: ImageIcon(AssetImage('assets/images/settings_icon.png')),
                label: 'settings',
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(
            side: BorderSide(
                width: 4, color: theme.colorScheme.primaryContainer)),
        onPressed: () {
          showModalBottomSheet(
              context: context, builder: (context) =>const AddTask());
        },
        backgroundColor: theme.colorScheme.primary,
        child: Icon(
          Icons.add,
          color: theme.colorScheme.onBackground,
          size: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
