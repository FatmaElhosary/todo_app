import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/settings_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ThemeLabel {
  const ThemeLabel({required this.label, required this.mode});
  final String label;
  final ThemeMode mode;
}

class DropDownSettings extends StatelessWidget {
  const DropDownSettings({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of<SettingsProvider>(context);
    AppLocalizations appLocal = AppLocalizations.of(context)!;
    final themes = [
      ThemeLabel(label: appLocal.light, mode: ThemeMode.light),
      ThemeLabel(label: appLocal.dark, mode: ThemeMode.dark),
      ThemeLabel(label: appLocal.light, mode: ThemeMode.system)
    ];

    return DropdownMenu<ThemeLabel>(
      initialSelection:
          themes.firstWhere((theme) => theme.mode == provider.currentMode),
      onSelected: (theme) => {
        if (theme != null) {provider.changeAppTheme(theme.mode)}
      },
      dropdownMenuEntries:
          themes.map<DropdownMenuEntry<ThemeLabel>>((ThemeLabel theme) {
        return DropdownMenuEntry(
          value: theme,
          label: theme.label, //theme.label,
          style: MenuItemButton.styleFrom(
              //foregroundtheme: Color(0xfffffff),
              ),
        );
      }).toList(),
    );
  }
}
