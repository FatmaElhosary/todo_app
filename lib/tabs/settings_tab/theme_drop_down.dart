import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/settings_provider.dart';

enum ThemeLabel {
  light('light', ThemeMode.light),
  dark('dark', ThemeMode.dark),
  system('system', ThemeMode.system);

  const ThemeLabel(this.label, this.mode);
  final String label;
  final ThemeMode mode;
}

class DropDownSettings extends StatelessWidget {
const  DropDownSettings({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of<SettingsProvider>(context);
    return DropdownMenu(
      initialSelection: provider.currentMode == ThemeMode.light
          ? ThemeLabel.light
          : provider.currentMode == ThemeMode.dark
              ? ThemeLabel.dark
              : ThemeLabel.system,
      onSelected: (theme) => {
        if (theme != null) {provider.changeAppTheme(theme.mode)}
      },
      dropdownMenuEntries: ThemeLabel.values
          .map<DropdownMenuEntry<ThemeLabel>>((ThemeLabel theme) {
        return DropdownMenuEntry(
          value: theme,
          label: theme.label,
          style: MenuItemButton.styleFrom(
              //foregroundtheme: Color(0xfffffff),
              ),
        );
      }).toList(),
    );
  }
}
