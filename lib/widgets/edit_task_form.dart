import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/firebase_utils.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/providers/tasks_provider.dart';
import 'package:todo_app/shared/shared.dart';
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
  TextEditingController taskController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  late Task task;
  late DateTime selectedDate;
  final formKey = GlobalKey<FormState>();
  late final AppLocalizations appLocal;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((value) {
      /// Here you can have your context and do what ever you want
      task = ModalRoute.of(context)!.settings.arguments as Task;
      descriptionController.text = task.description;
      taskController.text = task.title;
      selectedDate = task.dateTime;
    });
  }

  @override
  void dispose() {
    taskController.dispose();
    descriptionController.dispose();
    ////restore task.dateTime after it changed
    task.dateTime = selectedDate;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    appLocal = AppLocalizations.of(context)!;
    final ThemeData theme = Theme.of(context);
    task = ModalRoute.of(context)!.settings.arguments as Task;
    return Form(
      key: formKey,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10),
        children: <Widget>[
          TitleWidget(
            text: appLocal.editTask,
          ),
          GlobalTextField(
            controller: taskController,
            hint: '',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return appLocal.enterTask;
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
            validator: (value) {
              if (value == null || value.isEmpty) {
                return appLocal.enterTaskDetails;
              }
              return null;
            },
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
                initialDate: task.dateTime,
              );
              if (selectDate != null) {
                task.dateTime = selectDate;
              }
            },
            child: Text(
              dateFormat.format(task.dateTime),
              style: theme.textTheme.labelSmall,
              textAlign: TextAlign.center,
            ),
          ),

          /*   DatePickerWidget(
            dateTime: task.dateTime,
          ), */
          const SizedBox(
            height: 50,
          ),
          GlobalButton(
            text: appLocal.saveChanges,
            onPressed: () {
              editTask(task);
            },
          ),
        ],
      ),
    );
  }

  void editTask(Task task) {
    debugPrint(task.title);
    // Validate returns true if the form is valid, or false otherwise.
    if (formKey.currentState!.validate()) {
      task.title = taskController.text;
      task.description = descriptionController.text;
      FirebaseUtils.editTaskInFireStore(task)
          .timeout(const Duration(milliseconds: 500), onTimeout: () {
        debugPrint('success');
        ScaffoldMessenger.of(context)
            .showSnackBar(getSnackbar(appLocal.taskAupdatedSuccessfully));
        Provider.of<TasksProvider>(context, listen: false)
            .changeSelectedDate(task.dateTime);
        Navigator.pop(context);
      }).catchError((onError) {
        ScaffoldMessenger.of(context)
            .showSnackBar(getSnackbar(appLocal.errorTaskEdit));
        debugPrint(onError);
      });

      debugPrint('sssssssssss:${task.title}');
    }
  }
}
