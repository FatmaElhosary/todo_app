import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_app/tabs/settings_tab/language_drop_down.dart';

import 'package:todo_app/tabs/settings_tab/theme_drop_down.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocal = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        //  mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 25,
          ),
          Text(
            appLocal.language,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const DropDownLanguage(),
          Text(
            appLocal.mode,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const DropDownSettings(),
        ],
      ),
    );
  }
}
