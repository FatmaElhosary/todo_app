import 'package:flutter/material.dart';
import 'package:todo_app/widgets/text_form_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditTask extends StatelessWidget {
  static const String routName = 'edit-task';
  const EditTask({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations appLocal = AppLocalizations.of(context)!;
    final ThemeData theme = Theme.of(context);
    return Scaffold(
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
      body: Form(
        child: Column(
          children: [
            GlobalTextField(
              hint: '',
            ),
            GlobalTextField(
              hint: '',
            ),
          ],
        ),
      ),
    );
  }
}
