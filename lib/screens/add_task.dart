import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/firebase_utils.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/providers/tasks_provider.dart';
import 'package:todo_app/widgets/elaveted_btn.dart';
import 'package:todo_app/widgets/text_form_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_app/widgets/title_widget.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final DateFormat dateFormat = DateFormat("dd/MM/yyyy");

  DateTime selectedDate = DateTime.now();
  final taskController = TextEditingController();
  final descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    AppLocalizations local = AppLocalizations.of(context)!;
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TitleWidget(
            text: local.newTask,
          ),
          const SizedBox(
            height: 33,
          ),
          GlobalTextField(
            controller: taskController,
            hint: local.enterTask,
          ),
          const SizedBox(
            height: 33,
          ),
          GlobalTextField(
            controller: descriptionController,
            hint: local.enterTaskDetails,
            maxLines: 5,
          ),
          const SizedBox(
            height: 33,
          ),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              local.selectDate,
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  fontSize: 20, color: theme.colorScheme.onPrimaryContainer),
            ),
          ),
          InkWell(
            onTap: () async {
              final selectDate = await showDatePicker(
                context: context,
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(const Duration(days: 365)),
                initialDate: selectedDate,
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
            text: local.add,
            onPressed: addTask,
          ),
        ],
      ),
    );
  }

  void addTask() {
    // print('add');
    FirebaseUtils.addTaskToFirestore(Task(
            title: taskController.text,
            description: descriptionController.text,
            dateTime: selectedDate))
        .timeout(const Duration(milliseconds: 500), onTimeout: () {
      print('success');
      Provider.of<TasksProvider>(context, listen: false).getTasks();
      Navigator.pop(context);
    }).catchError((onError) {
      print(onError);
      Navigator.pop(context);
    });
  }
}
