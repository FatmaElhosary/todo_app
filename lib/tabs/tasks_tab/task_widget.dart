import 'package:flutter/material.dart';
import 'package:todo_app/app_theme.dart';
import 'package:todo_app/screens/edit_task.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TaskWidget extends StatefulWidget {
  const TaskWidget({super.key});

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Container(
      padding:
          const EdgeInsetsDirectional.symmetric(horizontal: 17, vertical: 20),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: theme.colorScheme.primaryContainer),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 50,
            width: 4,
            color: !isPressed ? theme.colorScheme.primary : AppTheme.greenColor,
            margin: const EdgeInsetsDirectional.only(end: 20),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                style: const ButtonStyle(
                    padding: MaterialStatePropertyAll(EdgeInsets.zero)),
                onPressed: () {
                  Navigator.of(context).pushNamed(EditTask.routName);
                },
                child: Text('task sfh  dhr gt',
                    style: !isPressed
                        ? theme.textTheme.titleSmall!.copyWith(
                            color: theme.colorScheme.primary, fontSize: 18)
                        : Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: AppTheme.greenColor, fontSize: 18)),
              ),
              Text(
                'details',
                style: theme.textTheme.titleMedium,
              )
            ],
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              markTaskAsDone();
            },
            child: Container(
              width: 69,
              height: 34,
              decoration: BoxDecoration(
                  color: !isPressed
                      ? theme.colorScheme.primary
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(10)),
              child: !isPressed
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
    );
  }

  void markTaskAsDone() {
    isPressed = !isPressed;
    setState(() {});
  }
}