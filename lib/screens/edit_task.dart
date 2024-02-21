import 'package:flutter/material.dart';
import 'package:todo_app/widgets/edit_task_form.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditTask extends StatelessWidget {
  static const String routName = 'edit-task';
  const EditTask({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations appLocal = AppLocalizations.of(context)!;
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        title: Text(appLocal.todo),
        titleSpacing: MediaQuery.of(context).size.width * .12,
        titleTextStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.primaryContainer,
        elevation: 0,
        toolbarHeight: MediaQuery.of(context).size.height * .15,
      ),
      body: Stack(
        children: [
          ColoredBox(
            color: Theme.of(context).colorScheme.primary,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .09,
              width: double.infinity,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            height: MediaQuery.of(context).size.height * .70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: theme.colorScheme.primaryContainer,
            ),
            child: const EditForm(),
          ),
        ],
      ),
    );
  }
}
