import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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

  final List<Widget> destinationWidgets = [
    const TasksHome(),
    const SettingsTab()
  ];

  @override
  Widget build(BuildContext context) {
    final AppLocalizations appLocal = AppLocalizations.of(context)!;
    final ThemeData theme = Theme.of(context);

    void onItemTapped(int index) {
      setState(() {
        currentPageIndex = index;
      });
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        title: Text(appLocal.todo),
        titleSpacing: 52,
        titleTextStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
        backgroundColor: theme.colorScheme.primary,
      ),
      body: destinationWidgets[currentPageIndex],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
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
          notchMargin: 10,
          shape: const CircularNotchedRectangle(),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: NavigationBar(
            onDestinationSelected: onItemTapped,
            selectedIndex: currentPageIndex,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            backgroundColor: theme.colorScheme.primaryContainer,
            indicatorColor: Colors.transparent,
            overlayColor: MaterialStatePropertyAll(theme.colorScheme.primary),
            destinations: const [
              NavigationDestination(
                icon: ImageIcon(AssetImage('assets/images/tasks_icon.png')),
                label: '',
              ),
              NavigationDestination(
                icon: ImageIcon(AssetImage('assets/images/settings_icon.png')),
                label: '',
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(
            side: BorderSide(
                width: 4, color: theme.colorScheme.primaryContainer)),
        onPressed: () {},
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
