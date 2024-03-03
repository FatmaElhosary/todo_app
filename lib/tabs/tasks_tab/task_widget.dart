import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app_theme.dart';
import 'package:todo_app/firebase_utils.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/providers/tasks_provider.dart';
import 'package:todo_app/screens/edit_task.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/shared/shared.dart';

class TaskWidget extends StatefulWidget {
  final Task task;
  const TaskWidget({super.key, required this.task});

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  late AppLocalizations local;
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    local = AppLocalizations.of(context)!;

    return Container(
      margin: const EdgeInsetsDirectional.only(
        end: 20,
        top: 8,
        bottom: 8,
        start: 20,
      ),
      child: Slidable(
        key: const ValueKey(0),
        startActionPane: ActionPane(
          // A motion is a widget used to control how the pane animates.
          motion: const BehindMotion(),
          children: [
            // A SlidableAction can have an icon and/or a label.
            SlidableAction(
              onPressed: deleteTask(context),
              backgroundColor: theme.colorScheme.onErrorContainer,
              foregroundColor: theme.colorScheme.onBackground,
              icon: Icons.delete,
              label: 'Delete',
            ),
            SlidableAction(
              onPressed: (context) {
                Navigator.of(context).pushNamed(
                  EditTask.routName,
                  arguments: widget.task,
                );
              },
              backgroundColor: theme.colorScheme.primary,
              foregroundColor: theme.colorScheme.onBackground,
              icon: Icons.edit,
              label: 'Edit',
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 17, vertical: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(15),
              color: theme.colorScheme.primaryContainer),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 4,
                height: 50,
                color: !widget.task.isDone
                    ? theme.colorScheme.primary
                    : AppTheme.greenColor,
                margin: const EdgeInsetsDirectional.only(end: 20),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.task.title.trim(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: !widget.task.isDone
                            ? theme.textTheme.titleSmall!.copyWith(
                                color: theme.colorScheme.primary, fontSize: 18)
                            : Theme.of(context).textTheme.titleSmall!.copyWith(
                                color: AppTheme.greenColor, fontSize: 18)),
                    Text(
                      widget.task.description.trim(),
                      style: theme.textTheme.titleMedium,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  toggleIsdone();
                },
                child: Container(
                  width: 69,
                  height: 34,
                  decoration: BoxDecoration(
                      color: !widget.task.isDone
                          ? theme.colorScheme.primary
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(10)),
                  child: !widget.task.isDone
                      ? Image.asset(
                          'assets/images/check_icon.png',
                          width: 30,
                          height: 30,
                        )
                      : Text(
                          AppLocalizations.of(context)!.done,
                          style: theme.textTheme.titleSmall!.copyWith(
                            color: AppTheme.greenColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void toggleIsdone() {
    widget.task.isDone = !widget.task.isDone;
    FirebaseUtils.editTaskInFireStore(widget.task)
        .timeout(const Duration(microseconds: 500), onTimeout: () {
      print('success');
    }).catchError((onError) => print(onError));
    setState(() {});
  }

  deleteTask(BuildContext context) {
    FirebaseUtils.deleteTaskFromFirestore(widget.task.id)
        .timeout(const Duration(microseconds: 500), onTimeout: () {
      getSnackbar('Task Deletet Successfully');
      Provider.of<TasksProvider>(context, listen: false)
          .getTasksBySelectedDate();
    }).catchError((onError) => {getSnackbar(local.errorTaskEdit)});
  }
}
/*   TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    alignment: AlignmentDirectional.centerStart,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      EditTask.routName,
                      arguments: widget.task,
                    );
                  },
                  child: Text(widget.task.title,
                      style: !isPressed
                          ? theme.textTheme.titleSmall!.copyWith(
                              color: theme.colorScheme.primary, fontSize: 18)
                          : Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: AppTheme.greenColor, fontSize: 18)),
                ),
                 */
                