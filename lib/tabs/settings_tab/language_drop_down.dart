import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/settings_provider.dart';

enum LanguageLabel {
  english('English', 'en'),
  arabic('Arabic', 'ar');

  const LanguageLabel(this.label, this.language);
  final String label;
  final String language;
}

class DropDownLanguage extends StatelessWidget {
  const DropDownLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of<SettingsProvider>(context);
    return DropdownMenu<LanguageLabel>(
      initialSelection: provider.appLanguage == 'en'
          ? LanguageLabel.english
          : LanguageLabel.arabic,
      onSelected: (language) {
        if (language != null) {
          provider.changeLanguage(language.language);
        }
      },
      dropdownMenuEntries: LanguageLabel.values
          .map<DropdownMenuEntry<LanguageLabel>>((LanguageLabel lang) {
        return DropdownMenuEntry(
          value: lang,
          label: lang.label,
          style: MenuItemButton.styleFrom(
              //foregroundtheme: Color(0xfffffff),
              ),
        );
      }).toList(),
    );
  }
}
