import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/settings_provider.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum LanguageLabel {
  english('english', 'en'),
  arabic('arabic', 'ar');

  const LanguageLabel(this.label, this.language);
  final String label;
  final String language;
}

class DropDownLanguage extends StatelessWidget {
  const DropDownLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocal = AppLocalizations.of(context)!;
    SettingsProvider provider = Provider.of<SettingsProvider>(context);
    final languages = {
      "english": appLocal.english,
      "arabic": appLocal.arabic,
    };
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: DropdownMenu<LanguageLabel>(
    
        expandedInsets: const EdgeInsets.all(0),
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
            //lang.label
            label: languages.entries
                .firstWhere((element) => element.key == lang.label)
                .value,
            style: MenuItemButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelSmall,
            ),
          );
        }).toList(),
      ),
    );
  }
}
