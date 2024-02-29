import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerWidget extends StatefulWidget {
  DateTime dateTime;
  final DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  DatePickerWidget({super.key, required this.dateTime});

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return InkWell(
      onTap: () async {
        final selectDate = await showDatePicker(
          context: context,
          firstDate: DateTime.now().subtract(const Duration(days: 365)),
          lastDate: DateTime.now().add(const Duration(days: 365)),
          initialDate: widget.dateTime,
        );
        if (selectDate != null) {
          setState(() {
            widget.dateTime = selectDate;
          });
        }
      },
      child: Text(
        widget.dateFormat.format(widget.dateTime),
        style: theme.textTheme.labelSmall,
        textAlign: TextAlign.center,
      ),
    );
  }
}
