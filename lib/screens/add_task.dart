import 'package:flutter/material.dart';
import 'package:todo_app/widgets/elaveted_btn.dart';
import 'package:todo_app/widgets/text_form_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations local = AppLocalizations.of(context)!;
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            local.newTask,
            style:
                Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 18),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 33,
          ),
          GlobalTextField(
            hint: local.enterTask,
          ),
          const SizedBox(
            height: 33,
          ),
          GlobalTextField(
            hint: local.enterTaskDetails,
            maxLines: 5,
          ),
          const SizedBox(
            height: 33,
          ),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              'Select Date',
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  fontSize: 20, color: theme.colorScheme.onPrimaryContainer),
            ),
          ),
          Text(
            '1/2/1993',
            style: theme.textTheme.labelSmall,
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          GlobalButton(
            text: 'Add',
            onPressed: addTask,
          ),
        ],
      ),
    );
  }

  void addTask() {
    print('add');
  }
}
