import 'package:flutter/material.dart';
import 'package:todo_app/screens/edit_task.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({super.key});

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
            color: theme.colorScheme.primary,
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
                    style: theme.textTheme.titleSmall!.copyWith(
                      color: theme.colorScheme.primary,
                      fontSize: 18,
                    )),
              ),
              Text(
                'details',
                style: theme.textTheme.titleMedium,
              )
            ],
          ),
          const Spacer(),
          Container(
            width: 69,
            height: 34,
            decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(10)),
            child: Image.asset(
              'assets/images/check_icon.png',
              width: 30,
              height: 30,
            ),
          )
        ],
      ),
    );
  }
}
