import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/network/firebase_task_utils.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/providers/tasks_provider.dart';
import 'package:todo_app/shared/shared.dart';
import 'package:todo_app/widgets/date_picker_field.dart';
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
  late AppLocalizations localLang;
  DateTime selectedDate = DateTime.now();
  final taskController = TextEditingController();
  final descriptionController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    taskController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    localLang = AppLocalizations.of(context)!;
    ThemeData theme = Theme.of(context);

    return Form(
      key: formKey,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          TitleWidget(
            text: localLang.newTask,
          ),
          const SizedBox(
            height: 33,
          ),
          GlobalTextField(
            controller: taskController,
            hint: localLang.enterTask,
            maxLines: 2,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return localLang.enterTask;
              }
              return null;
            },
          ),
          const SizedBox(
            height: 33,
          ),
          GlobalTextField(
            controller: descriptionController,
            hint: localLang.enterTaskDetails,
            maxLines: 5,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return localLang.enterTaskDetails;
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
              localLang.selectDate,
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  fontSize: 20, color: theme.colorScheme.onPrimaryContainer),
            ),
          ),

          DatePickerWidget(
            initialDateTime: selectedDate,
            setTaskDate: (dateTime) => selectedDate = dateTime,
          ),
          const SizedBox(
            height: 33,
          ),

          GlobalButton(
            text: localLang.add,
            onPressed: addTask,
          ),
          //////////////////////////////////
          ///
        ],
      ),
    );
  }

  void addTask() {
    if (formKey.currentState!.validate()) {
      FirebaseUtils.addTaskToFirestore(
              FirebaseAuth.instance.currentUser!.uid,
              Task(
                  title: taskController.text.trim(),
                  description: descriptionController.text.trim(),
                  dateTime: selectedDate))
          .then((_) {
        //get SnackBar/////////////////
        ScaffoldMessenger.of(context)
            .showSnackBar(getSnackbar(localLang.taskAddedSuccessfully));

        ////refresh tasks//////////////////
        Provider.of<TasksProvider>(context, listen: false).changeSelectedDate(
          FirebaseAuth.instance.currentUser!.uid,
            selectedDate);

        /////close eddit bottomsheet////////
        Navigator.pop(context);
      }).catchError((onError) {
        ScaffoldMessenger.of(context)
            .showSnackBar(getSnackbar(localLang.taskAdderror));
        Navigator.pop(context);
      });
    }
  }
}
