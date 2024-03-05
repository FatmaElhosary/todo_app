import 'package:flutter/material.dart';
import 'package:todo_app/shared/shared.dart';

class DatePickerWidget extends StatefulWidget {
  final DateTime initialDateTime;
  final void Function(DateTime) setTaskDate;

  const DatePickerWidget(
      {super.key, required this.initialDateTime, required this.setTaskDate});

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  late DateTime selectedDate;
  @override
  void initState() {
    selectedDate = widget.initialDateTime;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return InkWell(
      onTap: () async {
        await showDatePicker(
          context: context,
          firstDate: DateTime.now().subtract(const Duration(days: 365)),
          lastDate: DateTime.now().add(const Duration(days: 365)),
          initialDate: selectedDate,
        ).then((date) {
          if (date != null) {
            setState(() {
              widget.setTaskDate(date);
              selectedDate = date;
            });
          }
        });
      },
      child: Text(
        dateFormat.format(selectedDate),
        style: theme.textTheme.labelSmall,
        textAlign: TextAlign.center,
      ),
    );
  }
}
