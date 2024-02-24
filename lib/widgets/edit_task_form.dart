import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/widgets/elaveted_btn.dart';
import 'package:todo_app/widgets/text_form_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_app/widgets/title_widget.dart';

class EditForm extends StatefulWidget {
  const EditForm({super.key});

  @override
  State<EditForm> createState() => _EditFormState();
}

class _EditFormState extends State<EditForm> {
  final DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  final taskController = TextEditingController();
  final descriptionController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var task = ModalRoute.of(context)!.settings.arguments as Task;
    taskController.text = task.title;
    descriptionController.text = task.description;
    final AppLocalizations appLocal = AppLocalizations.of(context)!;

    ThemeData theme = Theme.of(context);
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10),
        child: Column(
          children: [
            TitleWidget(
              text: appLocal.editTask,
            ),
            GlobalTextField(
              controller: taskController,
              hint: '',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Pls Enter task';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 33,
            ),
            GlobalTextField(
              controller: descriptionController,
              hint: '',
            ),
            const SizedBox(
              height: 33,
            ),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                appLocal.selectDate,
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    fontSize: 20, color: theme.colorScheme.onPrimaryContainer),
              ),
            ),
            InkWell(
              onTap: () async {
                final selectDate = await showDatePicker(
                  context: context,
                  firstDate: DateTime.now().subtract(const Duration(days: 365)),
                  lastDate: DateTime.now().add(const Duration(days: 365)),
                  initialDate: DateTime.now(),
                );
                if (selectDate != null) {
                  setState(() {
                    selectedDate = selectDate;
                  });
                }
              },
              child: Text(
                dateFormat.format(selectedDate),
                style: theme.textTheme.labelSmall,
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            GlobalButton(
              text: appLocal.saveChanges,
              onPressed: editTask,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  void editTask() {
    // Validate returns true if the form is valid, or false otherwise.
    if (formKey.currentState!.validate()) {}
  }
}
