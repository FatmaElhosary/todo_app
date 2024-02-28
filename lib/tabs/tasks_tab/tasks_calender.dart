import 'package:flutter/material.dart';
import 'package:flutter_timeline_calendar/timeline/model/calendar_options.dart';
import 'package:flutter_timeline_calendar/timeline/model/datetime.dart';
import 'package:flutter_timeline_calendar/timeline/model/day_options.dart';
import 'package:flutter_timeline_calendar/timeline/model/headers_options.dart';
import 'package:flutter_timeline_calendar/timeline/utils/calendar_types.dart';
import 'package:flutter_timeline_calendar/timeline/widget/timeline_calendar.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/tabs/tasks_tab/tasks_provider.dart';

class TasksCalender extends StatefulWidget {
  const TasksCalender({super.key});

  @override
  State<TasksCalender> createState() => _TasksCalenderState();
}

class _TasksCalenderState extends State<TasksCalender> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final tasksProvider = Provider.of<TasksProvider>(context);
    return TimelineCalendar(
      calendarType: CalendarType.GREGORIAN,
      calendarLanguage: "en",
      calendarOptions: CalendarOptions(
        viewType: ViewType.DAILY,
        font: 'Roboto',
        toggleViewType: false,
        headerMonthElevation: 0,
        headerMonthShadowColor: Colors.transparent,
        headerMonthBackColor: Colors.transparent,
      ),
      dayOptions: DayOptions(
        compactMode: true,
        weekDaySelectedColor: theme.colorScheme.primary,
        selectedBackgroundColor: theme.colorScheme.primary,
        // weekDayUnselectedColor: theme.colorScheme.onPrimaryContainer,
        disableDaysBeforeNow: false,
      ),
      headerOptions: HeaderOptions(
          weekDayStringType: WeekDayStringTypes.SHORT,
          monthStringType: MonthStringTypes.FULL,
          backgroundColor: theme.colorScheme.primary,
          headerTextColor: theme.colorScheme.primaryContainer,
          navigationColor: theme.colorScheme.primaryContainer,
          resetDateColor: theme.colorScheme.primaryContainer),
      dateTime: CalendarDateTime(
          year: tasksProvider.selectedDate.year,
          month: tasksProvider.selectedDate.month,
          day: tasksProvider.selectedDate.day),
      onChangeDateTime: changeDatePicker,
      onDateTimeReset: changeDatePicker,
      onMonthChanged: changeDatePicker,
      onYearChanged: changeDatePicker,
    );
  }

  changeDatePicker(calendarDatetime) {
    Provider.of<TasksProvider>(context, listen: false)
        .changeSelectedDate(calendarDatetime.toDateTime());
  }
}
